#' Private functions that move or delete a file
#' 
#' @param name
#'   Name of the file (without extension)
#' @param newDir
#'   Directory where to move a file
#' @param subdir
#'   Subdirectory of the file
#' @param extension
#'   Extension of the file
#' @param mainDir
#'   Main directory ("scripts", "data" or "output")
#' @param errorName
#'   Name to display in error messages when file already exists
#' 
#' @noRd
#' 
.prMoveFile <- function(name, newDir, subdir = ".", extension, mainDir, errorName) {
  path <- .getPath(name, subdir, extension, mainDir)
  newPath <- .getPath(basename(name), newDir, extension, mainDir)
  
  if (file.exists(newPath)) stop(errorName, " ", newPath, "already exists.")
  
  file.rename(path, newPath)
}

.prDeleteFile <- function(name, subdir = ".", extension, mainDir) {
  file.remove(.getPath(name, subdir, extension, mainDir, create = FALSE))
}

#' Private function that returns the file name of a "substitute" expression.
#' 
#' Thanks to this function, quotes are optional in most functions of the package.
#' 
#' @param x result of the function "substitute"
#' @return character string
#' @noRd
.getName <- function(x) {
  x <- deparse(x)
  gsub('"|\'', "", x)
}
