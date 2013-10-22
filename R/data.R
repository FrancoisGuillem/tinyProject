prSave <- function(name, replace = FALSE, desc = "No description", subdir) {
  if (!is.character(name) || length(name) > 1) stop("Argument 'name' should be a character vector of length one. Have you forgotten quotes ?")
  
  if (missing(subdir)) {
    file <- sprintf("data/%s.rda", name)
  } else {
    file <- sprintf("data/%s/%s.rda", subdir, name)
  }
  if(!replace & file.exists(file)) {
    stop("File already exists. Use 'replace=TRUE' if you want to overwrite.")
  }
  eval(parse(text = prFormat("attr(#{name}, 'desc') <- desc")))
  save(list = name, file = file)
}

prLoad <- function(name, project= ".") {
  file <- sprintf("%s/data/%s.rda", 
                   project,
                   name)
  load(file, envir=.GlobalEnv)
  cat(sprintf("%s '%s' has been loaded :\n", class(get(name))[1], name))
  cat("   ", attr(get(name), "desc"), "\n")
}