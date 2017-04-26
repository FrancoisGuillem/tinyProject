#' Get the full path of a file
#' 
#' The function returns the absolute path of a file contained in the current
#' project.
#' 
#' @param x Relative path of a file contained in the project.
#' 
#' @return 
#' Absolute path of the file.
#' 
#' @examples 
#' \dontrun{
#'   prPath("data")
#' }
#' 
#' @export
prPath <- function(x) {
  x <- .getName(substitute(x))
  .getPath(x, create = FALSE)
}

# Get subdirectory of an object and create it if it does not exist
.getPath <- function(name, subdir = ".", extension = NULL, mainDir = ".", 
                     stopIfExists = FALSE, create = TRUE) {
  if (is.null(getOption("projectRoot"))) {
    stop("Project has not been initialized. Use 'prInit' to create a new project or 'prStart' to use an existing one")
  }
  subdir <- file.path(options("projectRoot"), mainDir, subdir, dirname(name))
  subdir <- gsub("(/\\.)+/", "/", subdir)
  subdir <- gsub("/\\.?$", "", subdir)
  
  if (!is.null(extension)) extension <- paste0(".", extension)
  else extension <- ""
  
  path <- sprintf("%s/%s%s", subdir, basename(name), extension)
  
  if (stopIfExists & file.exists(path))
    stop("File already exists. Use 'replace=TRUE' if you want to overwrite.")
  
  if (!dir.exists(subdir))  {
    if (create) dir.create(subdir, recursive = TRUE)
    else stop("Directory", subdir, "does not exist.")
  }
  
  path
}



