prHome <- function() {
  getOption("projectHome")
}

createProject <- function(projectName) {
  closeProject()
  path <- paste(prHome(), projectName, sep = "/")
  if (projectName %in% dir()) {
    stop("Project already exists !")
  }
  dir.create(path)
  setwd(path)
  options("currentProject" = projectName)
  dir.create("data")
  dir.create("output")
  dir.create("scripts")
  file.create(".RData")
  file.create(sprintf("%s.Rhistory", projectName))
  script("data")
  script("main")
  script("start")
}

project <- function(projectName, load = FALSE) {
  closeProject()
  options("currentProject" = projectName)
  setwd(paste(prHome(), projectName, sep = "/"))
  if (load) {
    load(".RData")
  }
  source("scripts/start.R")
  
  tools <- lsScripts()
  tools <- tools[grep("tools", tools)]
  if(length(tools) > 0) {
    sapply(sprintf("scripts/%s.R",tools), source)
  }
  
  if(interactive()) {
  	file.edit("scripts/main.R")
  	loadhistory(sprintf("%s.Rhistory", projectName))
  }
}

closeProject <- function(save = FALSE) {
  if(getwd() != prHome()) {
    if(save) {
      save.image()
    }
    if(!is.null(getOption("currentProject"))) {
      savehistory(sprintf("%s.Rhistory", getOption("currentProject")))
      setwd(prHome())
    }
  }
}


prLibrary <- function(package) {
  if(!require(package, character.only = TRUE)) {
    try(install.packages(package))
    try(library(package, character.only = TRUE))
  }
}

prLibrary <- Vectorize(prLibrary)