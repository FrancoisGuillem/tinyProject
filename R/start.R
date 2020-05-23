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
    cat("sourcing .Rprofile\n")
    source(.getPath(".Rprofile", mainDir = "."))
    
    # Source scripts with prefix "tools" or in dir "tools"
    tools <- union(
      list.files(.getPath(".", mainDir = "scripts"), pattern = "^tools.*\\.R$", recursive = TRUE),
      file.path("tools", list.files(.getPath("tools", mainDir = "scripts"), pattern = "\\.R$", 
                                    recursive = TRUE))
    )
    
    if(length(tools) > 0) {
      sapply(tools, function(s) {
        if(trace) cat("Sourcing", s, "\n")
        source(.getPath(s, mainDir = "scripts"))
      })
    }
    
    # Source "start.R" script
    if(trace) cat("Sourcing start.R\n")
    source(.getPath("start.R", mainDir = "scripts"))
    ok <- TRUE
  }, error = function(e) {
    options(projectRoot = oldProjectRoot)
  })
  
  invisible(ok)
}
