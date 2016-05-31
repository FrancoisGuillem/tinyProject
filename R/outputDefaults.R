#' Set default values of output functions
#' 
#' This function can modify the default values of the parameters of output
#' function like \code{\link{prWriteTable}} or \code{\link{prPdf}}. This can be
#' useful for instance to set in one and only one location the default size
#' of output images, the default font...
#' 
#' @param ...
#'   named arguments. The name of the arguments must be "table" to set the
#'   defaults of \code{\link{prWriteTable}}, \code{\link{prWriteCsv}} or
#'   \code{\link{prWriteCsv2}} or the name of the output function: "png" for
#'   \code{\link{prPng}}, "pdf" for \code{\link{prDdf}}. The value of each
#'   argument is a named list containing the new default value of the
#'   parameters one wants to modify (see examples). To reset the defaults values
#'   of a function, set the value to \code{NULL}.
#'
#' @return
#'   \code{prOutputDefaults} invisibly returns the list of modified defaults
#'   values.
#'   
#' @examples 
#' \dontrun{
#' # Remove row names of table output:
#' prOutputDefaults(table = list(row.names = FALSE))
#' 
#' # Modify the default size of pdf output:
#' prOutputDefaults(pdf = list(width = 8, height = 6))
#' 
#' # Reset default values for pdf and table output
#' prOutputDefaults(table = NULL, pdf = NULL)
#' }
#' 
#' @export
prOutputDefaults <- function(...) {
  opts <- .getDefaults()
  if (is.null(opts)) opts <- list()
  
  args <- list(...)
  
  for (n in names(args)) {
    opts <- .setDefaults(opts, args[[n]], n)
  }
  
  options(prOutput = opts)
  
  invisible(opts)
}

.setDefaults <- function(opts, defaults, of) {
  if (is.null(defaults)) {
    opts[[of]] <- NULL
    return(opts)
  }
  
  # Check args belong to the target function
  argName <- names(defaults)
  argNotInFun <- setdiff(argName, formalArgs(ifelse(of == "table", "write.table", of)))
  if (length(argNotInFun) > 0) 
    stop("Invalid argument ", paste(argNotInFun, collapse = ", ")) 
  
  args <- c(defaults, opts[[of]])
  opts[[of]] <- .mergeArgs(defaults, opts[[of]])
  
  return(opts)
}

.getDefaults <- function(x) {
  opts <- getOption("prOutput")
  if (is.null(opts)) opts <- list()
  if (missing(x)) return(opts)
  
  opts[[x]]
}

.mergeArgs <- function(args, defaults) {
  args <- c(args, defaults)
  args[!duplicated(names(args))]
}