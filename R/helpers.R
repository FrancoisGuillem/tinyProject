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





