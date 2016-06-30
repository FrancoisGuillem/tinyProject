#' @export
prBmp <- function(name, ..., replace = FALSE) {
  .prOutput(name, "bmp", bmp, "image", replace, ...)
}

#' @export
prJpeg <- function(name, ..., replace = FALSE) {
  .prOutput(name, "jpeg", jpeg, "image", replace, ...)
}

#' @export
prPng <- function(name, ..., replace = FALSE) {
  .prOutput(name, "png", png, "image", replace, ...)
}

#' @export
prTiff <- function(name, ..., replace = FALSE) {
  .prOutput(name, "tiff", tiff, "image", replace, ...)
}

#' @export
prPdf <- function(name, ..., replace = FALSE) {
  .prOutput(name, "pdf", pdf, "pdf", replace, ...)
}

#' @export
prSvg <- function(name, ..., replace = FALSE) {
  .prOutput(name, "svg", svg, "cairo", replace, ...)
}

#' @export
prCairoPdf <- function(name, ..., replace = FALSE) {
  .prOutput(name, "pdf", cairo_pdf, "cairo", replace, ...)
}

#' @export
prCairoPs <- function(name, ..., replace = FALSE) {
  .prOutput(name, "ps", cairo_ps, "cairo", replace, ...)
}

.prOutput <- function(name, extension, fun, defaultsName, replace, ...) {
  args <- .mergeArgs(list(...), .getDefaults(defaultsName))
  
  args$file <- .getPath(name, ".", extension, "output", stopIfExists = !replace)
  
  do.call(fun, args)
  
}