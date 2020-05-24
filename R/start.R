#' Source start and tools scripts
#' 
#' This function sources all scripts prefixed by \code{tools} or situated in a 
#' subdirectory called \code{tools}, then it sources the \code{start.R} script.
#' It is automatically called when a project is opened.
#' 
#' @param dir Path of the directory where the project is stored.
#' @param trace Should the function print what it is doing ?
#' 
#' @return 
#' TRUE if all scripts had been sourced without error and false otherwise.
#' 
#' @examples 
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' prStart(projectPath)
#' 
#' @export
#' 
prStart <- function(dir = ".", trace = TRUE) {
  calls <- vapply(sys.calls(), function(x) as.character(x)[1], character(1))
  if (sum(calls == "prStart") > 1) return(invisible(TRUE))
  
  ok <- FALSE
  
  oldProjectRoot <- getOption("projectRoot")
  options("projectRoot" = normalizePath(dir))
  
  tryCatch({
    if (trace) cat("sourcing .Rprofile\n")
    source(.getPath(".Rprofile", mainDir = "."))
    
    # Source startup scripts
    autoSource <- getOption("prAutoSource")
    if (is.null(autoSource)) autoSource <- c("^tools.*$", "^start$")
    
    scripts <- .lsScripts()$Script
    
    for (pattern in autoSource) {
      for (script in scripts[grepl(pattern, scripts)]) {
        if(trace) cat("Sourcing ", script, ".R\n", sep = "")
        prSource(script)
      }
    }
    
    ok <- TRUE
  }, error = function(e) {
    options(projectRoot = oldProjectRoot)
  })
  
  invisible(ok)
}
