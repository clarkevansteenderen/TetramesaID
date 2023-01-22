mypackages <- c("shiny", "shinyhelper", "magrittr", "DECIPHER", "seqinr", "shinyFiles", "shinythemes", "dendextend")
checkpkg <- mypackages[!(mypackages %in% installed.packages()[,"Package"])]
if(length(checkpkg)) install.packages(checkpkg, dependencies = TRUE)
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DECIPHER")


library(shiny)
library(DECIPHER)
library(seqinr)
library(dendextend)
library(shinyhelper)
library(magrittr) # allows you to use %>%
library(shinythemes)

ui <- fluidPage(theme = shinytheme("flatly"),

  titlePanel(strong(h1("TETRAMESA-ID"))),
  titlePanel(h3("For the genetic identification of Tetramesa wasps (Hymenoptera: Eurytomidae)")),
  img(src='tetramesa_image.png',  height = '150px', width = '200px'),
  titlePanel(h4("Created by Clarke van Steenderen")),
  br(),

  tabsetPanel(tabPanel("Home",
  #sidebarLayout(
    sidebarPanel(strong("Click to view the help file:", style = "color:darkgreen")
                 %>% helper(type = "markdown", content = "TetramesaIdentifier_Manual", colour = "green", icon = "question-circle"),
                 br(),
                 
                 # list.files("Gene_databases/") is the name of the folder in this project's file (Dactylopius Identifier R/ DactylopiusID) which contains .fas files
                 selectInput("selectfile","Select File", choice = c(list.files("Gene_databases/"), "Own file upload"), selected = "Own file upload" ),
                 fileInput("inFile", "Upload a .fas file"),
                 textInput("name", label = "Enter sequence name:", value = ">QUERY"),
                 textAreaInput("nuc_seq", label = "Enter nucleotide sequence:", placeholder = "e.g. AGCTTT", height = "250px"),
                 selectInput("distCorrection", "Distance correction method", choices = c("none", "Jukes-Cantor"), selected = "Jukes-Cantor"),
                 selectInput("treeMethod", "Agglomeration method", choices = c("complete", "single", "UPGMA", "WPGMA", "NJ", "ML"), selected = "NJ"),
                 actionButton("submit", label = "Submit", style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                 ),
  mainPanel() ),

  tabPanel("View Tree", plotOutput("treePlot", height = "1600px"))

)
  )

#)
