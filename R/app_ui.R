#' @import shiny
#' @import shinydashboard
app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    dashboardPage(
      dashboardHeader(title = "DataViewer"),
      dashboardSidebar(
        sidebarMenu(
          menuItem("Dashboard", tabName = "dashboard", icon=icon("dashboard"))
        )
      ),
      dashboardBody(
        tabItems(
          tabItem(
            tabName = "dashboard",
            fluidRow(
              box( 
                h4("This is a dashboard for viewing a user inputted data frame. Please enter a csv file below"),
                width = 12
              )
            ),
            fluidRow(
              box(
                mod_my_first_module_ui(
                  'datafile1', 'User data (.csv format)',
                  accept = c("text/csv", "text/comma-separated-values,text/plain")
                )
              )
            ),
            fluidRow(
              dataTableOutput("filetable1")
            )
          )
        )
      )
    )
  )
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = 'shinydt')
  )
 
  tags$head(
    golem::activate_js(),
    golem::favicon()
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    #tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}
