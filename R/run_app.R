#' Run the Shiny Application
#'
#' @param ... A series of options to be used inside the app.
#'
#' @export
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options
run_app <- function(...) {
  library(shiny)
  library(ggplot2)
  library(reticulate)
  
  reticulate::use_python("/Users/zero/anaconda3/envs/reticulate/bin/python3",
                         required = TRUE)
  reticulate::py_config()
  
  if (fs::file_exists("analysis/data/derived_data/python_model.joblib")) {
    print("Python model already exists, no need to re-run python script.")
  } else {
    print("Python model does not exist, running python model creation script")
    reticulate::source_python("drake/01-create_model.py")
  }
  
  rm(list = ls())
  reticulate::source_python("drake/02-load_model.py")
  
  py$python_model # python objects can be found under py$
  test_data  
  
  # app
  with_golem_options(app = shinyApp(ui = app_ui,
                                    server = app_server),
                     golem_opts = list(...))
}
