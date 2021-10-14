library(RSQLite, warn.conflicts = F, quietly = T)
library(tibble, warn.conflicts = F, quietly = T)
library(RPostgres, warn.conflicts = F, quietly = T)
library(DBI, warn.conflicts = F, quietly = T)
library(config, warn.conflicts = F, quietly = T)

## config
db_config <- config::get(file = "shiny_app/config.yml")$db

# Create database connection
conn <- dbConnect(RPostgres::Postgres(),
                  dbname=Sys.getenv(db_config$dbname),
                  host=Sys.getenv(db_config$host),
                  port=Sys.getenv(db_config$port),
                  user=Sys.getenv(db_config$user),
                  password=Sys.getenv(db_config$password))



# Create a query to prepare the 'mtcars' table with additional 'uid', 'id',
# & the 4 created/modified columns
create_yssup_query = "CREATE TABLE yssup (
  uid                             TEXT PRIMARY KEY,
  tipette                         TEXT,
  anzilotti_antonio               TEXT,
  baldi_duccio                    TEXT,
  benci_francesco                 TEXT,
  benedetti_umberto               TEXT,
  consiglio_giovanni              TEXT,
  fortuna_noah                    TEXT,
  leoni_emanuele                  TEXT,
  maresi_matteo                   TEXT,
  nardi_alessandro                TEXT,
  peggion_giacomo                 TEXT,
  piccini_cosimo                  TEXT,
  riessler_lorenzo                TEXT,
  scialdone_pietro                TEXT,
  created_at                      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by                      TEXT,
  modified_at                     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by                     TEXT
)"

# dbExecute() executes a SQL statement with a connection object
# Drop the table if it already exists
dbExecute(conn, "DROP TABLE IF EXISTS yssup")
# Execute the query created above
dbExecute(conn, create_yssup_query)

# Read in the RDS file created in 'data_prep.R'
dat <- readRDS("data_prep/prepped/yssup.RDS")

# add uid column to the `dat` data frame
dat$uid <- uuid::UUIDgenerate(n = nrow(dat))

# reorder the columns
dat <- dat %>%
  select(uid, everything())

# Fill in the SQLite table with the values from the RDS file
DBI::dbWriteTable(
  conn,
  name = "yssup",
  value = dat,
  overwrite = FALSE,
  append = TRUE
)

# List tables to confirm 'mtcars' table exists
dbListTables(conn)

# disconnect from SQLite before continuing
dbDisconnect(conn)
