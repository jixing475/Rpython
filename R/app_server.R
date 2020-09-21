#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  
  predictions <- reactive({
    
    if (input$test_cases == 1) {
      return(py$python_model$predict(t(test_data[1, ])))
    } else {
      return(py$python_model$predict(test_data[1:input$test_cases, ]))   
    }
    
  })
  
  output$barplot <- renderPlot({
    ggplot() + 
      aes(predictions()) +
      geom_bar()
  })
  
  output$prediction <- renderPrint({
    predictions()
  })
  
  output$python_config <- renderPrint({
    reticulate::py_config()
  })
}
