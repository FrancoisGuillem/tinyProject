prSave <- function(name, replace = FALSE, desc = "No description", subdir = ".") {
  if (!is.character(name) || length(name) > 1) stop("Argument 'name' should be a character vector of length one. Have you forgotten quotes ?")
  
  if(!file.exists("data")) {
    stop("Directory 'data' does not exist. Have you initialized the project with prInit ?")
  }
  
  subdir <- file.path("data", subdir, dirname(name))
  name <- basename(name)
  if (!dir.exists(subdir)) dir.create(subdir, recursive = TRUE)
  
  file <- sprintf("%s/%s.rda", subdir, name)
  
  if(!replace & file.exists(file)) {
    stop("File already exists. Use 'replace=TRUE' if you want to overwrite.")
  }
  eval(parse(text = sprintf("attr(%s, '._desc') <- desc", name)))
  eval(parse(text = sprintf("attr(%s, '._creationTime') <- Sys.time()", name)))
  save(list = name, file = file)
}

prLoad <- function(name, trace = TRUE) {
  file <- sprintf("data/%s.rda", name)
  load(file, envir=.GlobalEnv)
  
  name <- basename(name)
  
  if (trace) {
    if (class(get(name))[1] %in% c("numeric", "integer", "character", "logical")) {
      objClass <- paste(class(get(name))[1], 
                        ifelse(length(get(name)) == 1, "value", "vector"))
    } else {
      objClass <- class(get(name))[1]
    }
    objClass <- gsub("^(.)", "\\U\\1", objClass, perl = T)
    
    cat(sprintf("%s '%s' has been loaded%s%s\n", 
                objClass, 
                name,
                sprintf(" (saved on %s)", attr(get(name), "._creationTime")),
                ":", "."))
    
    cat("   ", attr(get(name), "._desc"), "\n")
  }
}