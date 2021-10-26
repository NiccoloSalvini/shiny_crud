#' table UI Function
#'
#' @description button and DT table modules
#' 
#' @importFrom shiny NS tagList fluidRow column actionButton tags
#' @importFrom DT DTOutput
#' @importFrom shinycssloaders withSpinner
#'
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_table_ui <- function(id){
  ns <- NS(id)
  tagList(
      fluidRow(
        column(
          width = 2,
          actionButton(
            ns("add_yssup"),
            "Add",
            class = "btn-success",
            style = "color: #fff;",
            icon = icon('plus'),
            width = '100%'
          ),
          tags$br(),
          tags$br()
        )
      ),
      fluidRow(
        column(
          width = 12,
          title = "yssup",
          DTOutput(ns('yssup_table')) %>%
            withSpinner(),
          tags$br(),
          tags$br()
        )
      )
  )
}
    
#' table Server Functions
#'
#' @noRd 
mod_table_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_table_ui("table_ui_1")
    
## To be copied in the server
# mod_table_server("table_ui_1")
