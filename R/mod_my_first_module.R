# Module UI
  
#' @title   mod_my_first_module_ui and mod_my_first_module_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_my_first_module
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_my_first_module_ui <- function(id, label="CSV file", ...){
  ns <- NS(id)
  tagList(
    fileInput(ns("file"), label, ...),
    checkboxInput(ns("heading"), "Has heading"),
    selectInput(ns("quote"), "Quote", c(
      "None"= "",
      "Double quote"= "\"",
      "Single quote"= "'"
    ))
  )
}
    
# Module Server
    
#' @rdname mod_my_first_module
#' @export
#' @keywords internal
#' @importFrom utils read.csv
mod_my_first_module_server <- function(input, output, session, stringsAsFactors){
  ns <- session$ns
  filedata1 <- reactive({
    # if no file selected don't do anything
    validate(need(input$file, message=FALSE))
    input$file 
  })
  
  dataframe <- reactive({
    utils::read.csv(
      filedata1()$datapath,
      header = input$heading,
      quote = input$quote,
      stringsAsFactors = stringsAsFactors
    )
  })
  
  return(dataframe)
}
    
## To be copied in the UI
# mod_my_first_module_ui("my_first_module_ui_1")
    
## To be copied in the server
# callModule(mod_my_first_module_server, "my_first_module_ui_1")
 
