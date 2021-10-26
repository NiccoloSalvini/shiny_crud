#' Yssup Table Module UI
#'
#' The UI portion of the module for displaying the yssup datatable
#'
#' @importFrom shiny NS tagList fluidRow column actionButton tags
#' @importFrom DT DTOutput
#' @importFrom shinycssloaders withSpinner
#'
#' @param id The id for this module
#'
#' @return a \code{shiny::\link[shiny]{tagList}} containing the UI element for registration
#'
yssup_register_module_ui <- function(id) {
  ns <- NS(id)
  
  
  fluidRow(
    column(
      width = 2,
      actionButton(
        ns("register_modal"),
        "Register",
        class = "btn-success",
        style = "color: #fff;",
        icon = icon('plus'),
        width = '100%'
      ),
      tags$br(),
      tags$br()
      )
    )
  
  ##  TODO
  ##  - aggiungi tagList con .JS script
  ##  - aggiungi script con JS function
}

#' Yssup Table Module Server
#'
#' The Server portion of the module for displaying the yssup datatable
#'
#' @importFrom shiny reactive reactiveVal observeEvent req callModule eventReactive passwordInput textInput actionButton
#' @importFrom DT renderDT datatable replaceData dataTableProxy
#' @importFrom dplyr tbl collect mutate arrange select filter pull
#'
#' @param None
#'
#' @return None

yssup_auth_module <- function(input, output, session) {
  
  session$userData$email_create <- reactiveVal(0)
  session$userData$password_create <- reactiveVal(0)
  
  observeEvent(input$register_modal, {
    
    showModal(
      modalDialog(
        title = "Autenticate yourself",
        textInput(
          ns("email_signin"), 
          "Your email"),
        passwordInput(password_create(), "Your password"),
        footer = actionButton("create", "Register")
        
      )
      
    )
    
    
  })
  
  
  
  
  
}
  

