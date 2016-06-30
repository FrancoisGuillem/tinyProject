#' Set default values of output functions
#' 
#' This function can modify the default values of the parameters of output
#' function like \code{\link{prWriteTable}} or \code{\link{prPdf}}. This can be
#' useful for instance to set in one and only one location the default size
#' of output images, the default font...
#' 
#' @param table
#'   Named list. The names correspond to argument names of \code{write.table} and
#'   the values to the new default values of these parameters. If this argument
#'   is \code{NULL} the defaults are reset to their original values
#' @param image
#'   Named list. The names correspond to argument names of \code{png} and
#'   the values to the new default values of these parameters. If this argument
#'   is \code{NULL} the defaults are reset to their original values
#' @param pdf
#'   Named list. The names correspond to argument names of \code{pdf} and
#'   the values to the new default values of these parameters. If this argument
#'   is \code{NULL} the defaults are reset to their original values
#' @param cairo
#'   Named list. The names correspond to argument names of \code{cairo_pdf} and
#'   the values to the new default values of these parameters. If this argument
#'   is \code{NULL} the defaults are reset to their original values
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
prOutputDefaults <- function(table = NA, image = NA, pdf = NA, cairo = NA) {
  opts <- .getDefaults()
  if (is.null(opts)) opts <- list()
  
  opts$table <- .setDefaults(opts$table, table, formalArgs("write.table"))
  opts$image <- .setDefaults(opts$image, image, formalArgs("png"))
  opts$pdf <- .setDefaults(opts$pdf, pdf, formalArgs("pdf"))
  opts$cairo <- .setDefaults(opts$cairo, cairo, formalArgs("cairo_pdf"))
  
  options(prOutput = opts)
  
  invisible(opts)
}

.setDefaults <- function(opts, defaults, validArgs) {
  if (is.null(defaults)) return(NULL)
  if (identical(defaults, NA)) return(opts)
  
  # Check args belong to the target function
  argName <- names(defaults)
  
  argNotInFun <- setdiff(argName, validArgs)
  if (length(argNotInFun) > 0) 
    stop("Invalid arguments ", paste(argNotInFun, collapse = ", ")) 
  
  .mergeArgs(defaults, opts)
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