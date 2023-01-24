library(shinyFiles)
library(shiny)
library(DECIPHER)
library(seqinr)
library(dendextend)
library(shinyhelper)
library(magrittr) # allows you to use %>%
library(shinythemes)
library(janitor)
library(shinyjs)


server <- function(input, output, session) {
  
  # this prints a dot to the cosole every 10 seconds so that the screen doesn't time out
  autoInvalidate <- reactiveTimer(10000)
  observe({
    autoInvalidate()
    cat(".")
  })
  
  observe_helpers(help_dir = "HelpFile")
  
  observe({
    
    data1 = read.fasta(file.path("Gene_databases/", input$selectfile))
    
    observeEvent(input$submit, {
      
      n = input$name
      
      q = input$nuc_seq
      q = as.list(q)
      names(q) = c(n)
      
      # append the query sequence to the chosen/uploaded database
      fin = c(data1,q)
      
      # create a temporary file in the temporary directory
      my.file = tempfile(pattern = "TEMPFASTAFILE", tmpdir = tempdir(), fileext = ".fas")
      
      # put the entire dataset (chosen (12S, 18S etc) + query sequence) into that temporary file
      write.fasta(sequences=fin,names=names(fin),file.out=my.file) 
      
      # assign the temporary file to the variable 's4'
      s4 = (my.file)
      
      # read in the data as DNA sequences
      alignedseqs = readDNAStringSet(s4)
      
      # this bit is for the progress bar
      progress <- Progress$new(session, min=1, max=2)
      on.exit(progress$close())
      
      progress$set(message = 'Identifying',
                   detail = 'Click the View Tree tab when complete to view the result.')
      
      for (i in 1:2) {
        progress$set(value = i)
        Sys.sleep(0.5)
      }
      
      # align the sequences
      alignedseqs2 = AlignSeqs(alignedseqs)
      
      # create a distance matrix
      d=DistanceMatrix(alignedseqs2, correction=input$distCorrection, verbose=T) 
  
      shinyalert::shinyalert("Complete", 
                             "Alignment and phylogeny complete. View the tree and the best match results in the tabs.", 
                             type = "success")
      
      # create a phylogenetic tree
      clust = IdClusters(d, method=input$treeMethod, type = "dendrogram", cutoff=.05, showPlot=TRUE, myXStringSet=alignedseqs2, verbose=T)
      # convert the tree to a dendrogram (so that it can be manipulated (colour etc.))
      WriteDendrogram(x = clust)
      # change the label text sizes
      clust <- set(clust, "labels_cex", 0.75)
      # make the input name red. grepl refers to the search for a pattern of text
      col_red <- ifelse(grepl(input$name, labels(clust)),"red", "black")
      # make the input name have a thick line (lwd size 10 here)
      thickness <- ifelse(grepl(input$name, labels(clust)),10,1)
      
      clust <- assign_values_to_leaves_edgePar(dend=clust, value = col_red, edgePar = "col")
      clust <- assign_values_to_leaves_edgePar(dend=clust, value = thickness, edgePar = "lwd")
      
      output$treePlot = renderPlot(plot(clust, horiz = T)) 
      
      
      ######################
      # some extra info
      ######################
      
      if(input$selectfile == "COI.fas") 
        source_mods = read.csv("source_mods/COI_source_mods.csv", header = TRUE)
      if(input$selectfile == "28S.fas")
        source_mods = read.csv("source_mods/28S_source_mods.csv", header = TRUE)
      
      source_mods = janitor::clean_names(source_mods)
      
      # extract just the row with the p-dists for just the query sequence compared to everything else
      query_dists = d[ input$name,]
      
      # rearrange so that it's a long column rather than in a single row
      query_dists = reshape2::melt(query_dists)
    
      # arrange from smallest to largest
      query_dists = dplyr::arrange(query_dists, value)
      
      # get the percentage similarity
      query_dists$percent_sim = round(100 - (query_dists$value*100), 2)
      
      query_dists = as.data.frame(query_dists)
      
      # remove the comparison to the query sequence
      query_dists = subset(query_dists, rownames(query_dists) != input$name)
      
      for( i in 1:nrow( query_dists ) ){
        for( j in 1:nrow( source_mods )){
          if(rownames(query_dists)[i] == source_mods$sequence_id[j]){

            query_dists$genbank[i] <- source_mods$genbank_id[j]
            query_dists$organism[i] <- source_mods$organism[j]
            query_dists$country[i] <- source_mods$country[j]
            query_dists$host[i] <- source_mods$host[j]
            query_dists$lat_lon[i] <- source_mods$lat_lon[j]
          }
        }
      }
      

query_dists = rename(query_dists, c(value =  "p-distance", percent_sim = "Similarity (%)",
                      genbank = "GenBank ID", organism = "Morphospecies",
                        country = "Country", host = "Host grass",
                        lat_lon = "GPS coordinates")
                       )
      
      output$blast_results = renderTable(query_dists, rownames = TRUE)
      
      output$download_blast <- downloadHandler(
        filename = function() {
          paste("search_results", ".csv", sep="")
        },
        content = function(file) {
          write.csv(query_dists, file)
        }
      )
      
      # remove the temporary file
      file.remove(my.file)
      
    })
    
    
  })
  
  
    }
