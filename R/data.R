prSave <- function(name, replace = FALSE, desc = "No description", subdir) {
  if (!is.character(name) || length(name) > 1) stop("Argument 'name' should be a character vector of length one. Have you forgotten quotes ?")
  
  if(!file.exists("data")) {
    stop("Directory 'data' does not exist. Have you initialized the project with prInit ?")
  }
  
  if (missing(subdir)) {
    file <- sprintf("data/%s.rda", name)
  } else {
    file <- sprintf("data/%s/%s.rda", subdir, name)
  }
  if(!replace & file.exists(file)) {
    stop("File already exists. Use 'replace=TRUE' if you want to overwrite.")
  }
  eval(parse(text = sprintf("attr(%s, '._desc') <- desc", name)))
  eval(parse(text = sprintf("attr(%s, '._creationTime') <- Sys.time()", name)))
  save(list = name, file = file)
}

prLoad <- function(name, trace = TRUE, description = TRUE, creationTime = TRUE) {
  file <- sprintf("data/%s.rda", name)
  load(file, envir=.GlobalEnv)
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
                ifelse(creationTime, 
                       sprintf(" (saved on %s)", attr(get(name), "._creationTime")),
                       ""),
                ifelse(description, ":", ".")))
    
    if(description) {
      cat("   ", attr(get(name), "._desc"), "\n")
    }
  }
}