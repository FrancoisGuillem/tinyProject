#' Source start and tools scripts
#' 
#' This function sources all scripts prefixed by \code{tools} or situated in a 
#' subdirectory called \code{tools}, then it sources the \code{start.R} script.
#' It is automatically called when a project is opened.
#' 
#' @param trace
#' Should the function print what it is doing ?
#' 
#' @return 
#' TRUE if all scripts had been sourced without error and false otherwise.
#' 
#' @examples 
#' \dontrun{
#' prStart()
#' }
#' 
#' @export
#' 
prStart <- function(trace = TRUE) {
  ok <- FALSE
  
  tryCatch({
    # Source scripts with prefix "tools" or in dir "tools"
    tools <- union(
      list.files("scripts", pattern = "^tools.*\\.R$", recursive = TRUE),
      file.path("tools", list.files("scripts/tools", pattern = "\\.R$", recursive = TRUE))
    )
    
    if(length(tools) > 0) {
      sapply(tools, function(s) {
        if(trace) cat("Sourcing", s, "\n")
        source(sprintf("scripts/%s",s))
      })
    }
    
    # Source "start.R" script
    if(trace) cat("Sourcing start.R\n")
    source("scripts/start.R")
    ok <- TRUE
  }, error = function(e) return())
  
  invisible(ok)
}