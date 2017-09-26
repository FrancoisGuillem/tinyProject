#' Save plots as image files
#' 
#' These functions can be used in place of their corresponding base R functions
#' to save plots as image files.
#' 
#' @param name Name of the output file, without extension. One can also specify
#'   subdirectory where to save the file.
#' @param ... parameters passed to the corresponding base R function. For
#'   instance, for \code{prPng}, these parameters will be passed to function
#'   \code{\link[grDevices]{png}} 
#' @param replace If the file already exists, should it be overwritten ?
#' 
#' @details 
#' These functions has three advantages over the base functions:
#' \itemize{
#'   \item Files are automatically created in the output folder of the project
#'     even if the working directory has changed. Subdirectories are automatically
#'     created if they do not exist.
#'   \item By default, these functions do not erase an existing file. This avoids
#'     accidents.
#'   \item The default values of the parameters (width, height, etc.) can be
#'     modified with function \code{\link{prOutputDefaults}}.
#' }
#' 
#' @return 
#' These functions are used to open a plot device. Nothing is returned.
#' 
#' @examples 
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' prPng("test")
#' plot(rnorm(100))
#' dev.off()
#' # The plot is saved in "output/test.png"
#' list.files(projectPath, recursive = TRUE, include.dirs = TRUE)
#' 
#' prPng("mysubdirectory/test")
#' plot(rnorm(100))
#' dev.off()
#' # The plot is saved in "output/mysubdirectory/test.png"
#' list.files(projectPath, recursive = TRUE, include.dirs = TRUE)
#' 
#' @export
#' @rdname prOutput
prBmp <- function(name, ..., replace = FALSE) {
  .prOutput(name, "bmp", bmp, "image", replace, ...)
}

#' @export
#' @rdname prOutput
prJpeg <- function(name, ..., replace = FALSE) {
  .prOutput(name, "jpeg", jpeg, "image", replace, ...)
}

#' @export
#' @rdname prOutput
prPng <- function(name, ..., replace = FALSE) {
  .prOutput(name, "png", png, "image", replace, ...)
}

#' @export
#' @rdname prOutput
prTiff <- function(name, ..., replace = FALSE) {
  .prOutput(name, "tiff", tiff, "image", replace, ...)
}

#' @export
#' @rdname prOutput
prPdf <- function(name, ..., replace = FALSE) {
  .prOutput(name, "pdf", pdf, "pdf", replace, ...)
}

#' @export
#' @rdname prOutput
prSvg <- function(name, ..., replace = FALSE) {
  .prOutput(name, "svg", svg, "cairo", replace, ...)
}

#' @export
#' @rdname prOutput
prCairoPdf <- function(name, ..., replace = FALSE) {
  .prOutput(name, "pdf", cairo_pdf, "cairo", replace, ...)
}

#' @export
#' @rdname prOutput
prCairoPs <- function(name, ..., replace = FALSE) {
  .prOutput(name, "ps", cairo_ps, "cairo", replace, ...)
}

.prOutput <- function(name, extension, fun, defaultsName, replace, ...) {
  args <- .mergeArgs(list(...), .getDefaults(defaultsName))
  
  args$file <- .getPath(name, ".", extension, "output", stopIfExists = !replace)
  
  do.call(fun, args)
  
}