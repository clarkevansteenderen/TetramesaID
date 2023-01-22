library(shiny)
library(DECIPHER)
library(seqinr)
library(dendextend)

server <- function(input, output, session) {
  
  # this prints a dot to the cosole every 10 seconds so that the screen doesn't time out
  autoInvalidate <- reactiveTimer(10000)
  observe({
    autoInvalidate()
    cat(".")
  })
  
  observe_helpers(help_dir = "HelpFile")
  
  observe({
    
    # the user can upload their own database of fasta files. Note that they must be unaligned
    if(input$selectfile == "Own file upload"){
    file1 = input$inFile
    if (is.null(file1)) {
      return(NULL)
    } 
    data1 = read.fasta(file1$datapath, seqtype = "DNA")
    }
    
    else (data1 = read.fasta(file.path("Gene_databases/", input$selectfile)))
    
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
      
      # remove the temporary file
      file.remove(my.file)
      
      
    })
    
    
  })
  
  
  
  
    }
