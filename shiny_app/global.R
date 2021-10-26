# Library in packages used in this application
library(shiny, quietly = T, warn.conflicts = F)
library(firebase, quietly = T, warn.conflicts = F)
library(DT, quietly = T, warn.conflicts = F)
library(DBI, quietly = T, warn.conflicts = F)
library(RSQLite, quietly = T, warn.conflicts = F)
library(shinyjs, quietly = T, warn.conflicts = F)
library(shinycssloaders, quietly = T, warn.conflicts = F)
library(lubridate, quietly = T, warn.conflicts = F)
library(shinyFeedback, quietly = T, warn.conflicts = F)
library(dplyr, quietly = T, warn.conflicts = F)
library(dbplyr, quietly = T, warn.conflicts = F)
library(RPostgres, quietly = T, warn.conflicts = F)
library(config, quietly = T, warn.conflicts = F)


# config context
db_config <- config::get()$db


# Create database connection
conn <- dbConnect(RPostgres::Postgres(),
                  dbname=Sys.getenv(db_config$dbname),
                  host=Sys.getenv(db_config$host),
                  port=Sys.getenv(db_config$port),
                  user=Sys.getenv(db_config$user),
                  password=Sys.getenv(db_config$password))

# Stop database connection when application stops
shiny::onStop(function() {
  dbDisconnect(conn)
})

# Turn off scientific notation
options(scipen = 999)

# Set spinner type (for loading)
options(spinner.type = 8)
