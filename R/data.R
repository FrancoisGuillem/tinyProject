prSave <- function(name, replace = FALSE, subdir) {
  if (missing(subdir)) {
    file <- sprintf("data/%s.rda", name)
  } else {
    file <- sprintf("data/%s/%s.rda", subdir, name)
  }
  if(!replace & file.exists(file)) {
    stop("File already exists")
  }
  save(list = name, file = file)
}

prLoad <- function(name, project= getOption("currentProject")) {
  file <- sprintf("%s/%s/data/%s.rda", 
                   getOption("projectHome"),
                   project,
                   name)
  load(file, envir=.GlobalEnv)
}