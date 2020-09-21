#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    fluidPage(
      h1("Rpython"),
      titlePanel("Scikit-learn Breast Cancer Data"),
      
      fluidRow(
        column(2,
               sliderInput("test_cases",
                           "Number test cases:",
                           min = 1,
                           max = nrow(test_data),
                           value = 1),
               verbatimTextOutput("prediction")
        ),
        column(10,
               plotOutput("barplot"),
               verbatimTextOutput("python_config")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'Rpython'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

