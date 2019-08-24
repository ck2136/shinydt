#' @import shiny
app_server <- function(input, output, session) {
  # List the first level callModules here
  datafile <- callModule(
    mod_my_first_module_server,
    "datafile1", stringsAsFactors=FALSE
  )
  #This previews the CSV data files
  output$filetable1 <- renderDataTable({
    datafile()
  })
}
