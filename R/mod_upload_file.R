#' upload_file UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_upload_file_ui <- function(id){
  ns <- NS(id)
  tagList(
    fileInput(ns("file"), label)
  )
}
    
#' upload_file Server Function
#'
#' @noRd 
mod_upload_file_server <- function(input, output, session){
  ns <- session$ns
  # The selected file, if any
  userFile <- reactive({
    # If no file is selected, don't do anything
    validate(need(input$file, message = FALSE))
    input$file
  })
  
  # The user's data, parsed into a data frame
  dataframe <- reactive({
    rio::import(userFile()$datapath)
  })
  
  # We can run observers in here if we want to
  observe({
    msg <- sprintf("File %s was uploaded", userFile()$name)
    cat(msg, "\n")
  })
  
  # Return the reactive that yields the data frame
  return(dataframe)
}
    
## To be copied in the UI
# mod_upload_file_ui("upload_file_ui_1")
    
## To be copied in the server
# callModule(mod_upload_file_server, "upload_file_ui_1")
 
