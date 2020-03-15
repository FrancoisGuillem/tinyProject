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
#' @author Francois Guillem
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


### from envimaR

#' Generates a variable with a certain value in the R environment
#'
#' @description  Generates a variable with a certain value in the R environment.
#'
#' @param names  vector with the  names of the variable(s)
#' @param values vector with values of the variable(s)
#'
#' @name makeGlobalVariable
#' @keywords internal
#'
#' @author Christoph Reudenbach, Thomas Nauss
#'
#'@examples
#' \dontrun{
#' # creates the global variable \code{path_data} with the value \code{~/data}
#' makeGlobalVariable(names = "path_data", values = "~/data")
#'
#' }

makeGlobalVariable = function(names, values) {
  if (!exists("enivmaR")) enivmaR = new.env(parent=globalenv())

  for(i in seq(length(names))){
    if (exists(names[i], envir = enivmaR)) {
      warning(paste("The variable", names[i],"already exist in .GlobalEnv"))
    } else {
      assign(names[i], values[i], envir = enivmaR, inherits = TRUE)
    }
  }
}




#' Compile folder list and create folders
#'
#' @description  Compile folder list with absolut paths and create folders if
#' necessary.
#'
#' @param root_folder root directory of the project.
#' @param folders list of subfolders within the project directory.
#' @param folder_names names of the variables that point to subfolders. If not
#' provided, the base paths of the folders is used.
#' @param path_prefix a prefix for the folder names.
#' @param create_folders create folders if not existing already.
#'
#' @return  List with folder paths and names.
#'
#' @keywords internal
#'
#' @author Christoph Reudenbach, Thomas Nauss
#'
#'@examples
#' \dontrun{
#' # createFolders(root_folder = "~/edu", folders = c("data/", "data/tmp/"))
#' }
# Create folder list and set variable names pointing to the path values
createFolders = function(root_folder, folders,
                         folder_names = NULL, path_prefix = "path_",
                         create_folders = TRUE){

  folders = lapply(folders, function(f){
    file.path(root_folder, f)
  })

  if(is.null(folder_names)){
    names(folders) = basename(unlist(folders))
    tmplt = unlist(folders)

    while(any(duplicated(names(folders)))){
      tmplt = dirname(tmplt)
      dplcts = which(duplicated(names(folders), fromLast = FALSE) |
                       duplicated(names(folders), fromLast = TRUE))
      names(folders)[dplcts] =
        paste(basename(tmplt)[dplcts], names(folders[dplcts]), sep = "_")
    }
  } else {
    names(folders) = folder_names
  }

  if(!is.null(path_prefix)) names(folders) = paste0(path_prefix, names(folders))

  # Check paths for existance and create if necessary
  for(f in folders){
    if(!file.exists(f)) dir.create(f, recursive = TRUE)
  }

  return(folders)
}









