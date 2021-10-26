fluidPage(
  shinyFeedback::useShinyFeedback(),
  shinyjs::useShinyjs(),
  firebase::useFirebase(),
  firebase::useFirebaseUI(),
  
  # yssup_register_module_ui("register_modal"),
  # Application Title
  
  reqSignin(
  
    titlePanel(h1("Explore Yssup records", align = 'center'),
               windowTitle = "yssup database"),
    
    yssup_table_module_ui("yssup_table")
  
  )
)


