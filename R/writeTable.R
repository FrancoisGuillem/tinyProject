#' Write data in an output text file
#' 
#' These functions are wrappers to \code{write.table}, \code{write.csv} and 
#' \code{write.csv2}. They write a matrix or a data.table in a ".txt" or ".csv"
#' file in the output folder. The file created has the same name as the object.
#' 
#' @param name
#'   Name of the object to write. Quotes are optional. This argument can also 
#'   specify the subdirectory of folder "output" where to write the file.
#' @param replace If the file already exists, should it be overwritten ?
#' @param ...
#'   arguments to \code{write.table}
#'   
#' @examples 
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' mydata <- data.frame(x = 1:10, y = rnorm(10))
#' 
#' prWriteTable(mydata)
#' list.files(projectPath, recursive = TRUE, include.dirs = TRUE)
#' 
#' # Write in a subdirectory of "output"
#' prWriteTable("mydir/mydata")
#' list.files(projectPath, recursive = TRUE, include.dirs = TRUE)
#'
#' @export
#' 
prWriteTable <- function(name, ..., replace = FALSE) {
  name <- .getName(substitute(name))
  .prWriteTable(name, replace, write.table, "txt", ...)
}

#' @rdname prWriteTable
#' @export
prWriteCsv <- function(name, ..., replace = FALSE) {
  name <- .getName(substitute(name))
  .prWriteTable(name, replace, write.csv, "csv", ...)
}

#' @rdname prWriteTable
#' @export
prWriteCsv2 <- function(name, ..., replace = FALSE) {
  name <- .getName(substitute(name))
  .prWriteTable(name, replace, write.csv2, "csv", ...)
}

.prWriteTable <- function(name, replace, fun, extension, ...) {
  path <- .getPath(name, ".", extension, "output", stopIfExists = !replace)
  
  x <- get(basename(name))
  
  args <- append(list(x = x, file = path), .mergeArgs(list(...), .getDefaults("table")))
  
  do.call(fun, args)
}
