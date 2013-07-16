initProject <- function() {
  # Project Name
  project <- getwd()
  project <- str_match(project, "/([^/]+)$")[,2]
  
  # Create directories and scripts if they do not exist
  dirCreate <- function(x) {
    if(! file.exists(x)) dir.create(x) else warning("Directory '", x, "' already exists.")
  }
  dirCreate ("data")
  dirCreate ("output")
  dirCreate ("scripts")

  script("data", template = "data")
  script("main", template = "main")
  script("start", template = "start")
  
  cat('library(project)
  
tools <- lsScripts()$Script
tools <- tools[grep("^tools", tools)]
if(length(tools) > 0) {
  sapply(sprintf("scripts/%s.R",tools), source)
}
rm(tools)
source("scripts/start.R")
', file = ".Rprofile")
}



prLibrary <- function(...) {
  packages <- unlist(list(...))
  for (p in packages) {
    if(!require(p, character.only = TRUE, quietly=TRUE)) {
      try(install.packages(p))
      try(library(p, character.only = TRUE))
    }
  }
}