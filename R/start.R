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
#' @author Francois Guillem
#' @examples
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#'
#' prStart(projectPath)
#'
#' @export
#'
prStart <- function(dir = ".", trace = TRUE) {
  options("projectRoot" = normalizePath(dir))
  oldProjectRoot <- getOption("projectRoot")
  options("projectRoot" = normalizePath(dir))
  ok <- FALSE
  prLoad(name="proj_env")
  tryCatch({
    # Source scripts with prefix "tools" or in dir "tools"
    tools <- union(
      list.files(.getPath("scripts"), pattern = "^tools.*\\.R$", recursive = TRUE),
      file.path("tools", list.files(.getPath("scripts/tools"), pattern = "\\.R$",
                                    recursive = TRUE))
    )

    if(length(tools) > 0) {
      sapply(tools, function(s) {
        if(trace) cat("Sourcing", s, "\n")
        source(.getPath(sprintf("scripts/%s",s)))
      })
    }

    # Source "start.R" script
    if(trace) cat("Sourcing start.R\n")
    source(.getPath("scripts/start.R"))
    ok <- TRUE
  }, error = function(e) {
    options(projectRoot = oldProjectRoot)
  })

  invisible(ok)
}
