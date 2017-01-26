#' Easily save and load data
#' 
#' \code{prSave} and \code{prLoad} save and load data in the folder \code{data} 
#' of the project. Each object is saved in distinct file with the same name as
#' the object and the extension \code{rda}.
#' 
#' @param name
#'   Name of the object to save or to load. Quotes are optional. Optionaly, one
#'   can also specify the subfolder where to save or load the object. 
#' @param replace
#'   If the file already exists, should it be overwrited ? The prupose of this
#'   parameter is to avoid some dramas. Use it with caution.
#' @param desc
#'   Short description of the object.
#' @param subdir
#'   subdirectory where to save or load the object. 
#' @param trace
#'   Should information about the loaded object be printed ?
#' @param envir
#'   the environment where the object should be loaded. By default, it is the
#'   global environement so that the object should be easily accessible in all
#'   settings
#'   
#' @seealso 
#' \code{\link{prLibrary}}, \code{\link{prSource}}
#' 
#' @examples 
#' \dontrun{
#' 
#' # Assume that project has been setup with prInit
#' 
#' test <- rnorm(100)
#' prSave(test)
#' 
#' # Save again but add a description
#' prSave(test, replace = TRUE, desc = "Just a test !")
#' 
#' prLoad(test)
#' 
#' # It is also possible to save/load in subfolders
#' prSave(test, subdir = "testdir", desc = "Saved in subfolder")
#' 
#' # Or equivalently
#' prSave("testdir/test", desc = "Saved in subfolder")
#' 
#' prLoad(test, subdir="testdir")
#' prLoad("testdir/test")
#' }
#'   
#' @export
#'
prSave <- function(name, replace = FALSE, desc = "No description", subdir = ".") {
  name <- .getName(substitute(name))
  if (!is.character(name) || length(name) > 1) stop("Argument 'name' should be a character vector of length one. Have you forgotten quotes ?")
  
  if(!file.exists(.getPath("data"))) {
    stop("Directory 'data' does not exist. Have you initialized the project with prInit ?")
  }

  file <- .getPath(name, subdir, "rda", "data", stopIfExists = !replace)
  name <- basename(name)
  
  eval(parse(text = sprintf("attr(%s, '._desc') <- desc", name)))
  eval(parse(text = sprintf("attr(%s, '._creationTime') <- Sys.time()", name)))
  save(list = name, file = file)
}

#' @rdname prSave
#' @export
#' 
prLoad <- function(name, subdir = ".", trace = TRUE, envir=.GlobalEnv) {
  name <- .getName(substitute(name))
  file <- .getPath(name, subdir, "rda", "data")
  name <- basename(name)
  
  load(file, envir=envir)
  
  if (trace) {
    if (class(get(name))[1] %in% c("numeric", "integer", "character", "logical")) {
      objClass <- paste(class(get(name))[1], 
                        ifelse(length(get(name)) == 1, "value", "vector"))
    } else {
      objClass <- class(get(name))[1]
    }
    objClass <- gsub("^(.)", "\\U\\1", objClass, perl = T)
    
    cat(sprintf("%s '%s' has been loaded%s%s\n", 
                objClass, 
                name,
                sprintf(" (saved on %s)", attr(get(name), "._creationTime")),
                ":", "."))
    
    cat("   ", attr(get(name), "._desc"), "\n")
  }
}

#' Move and delete data files.
#' 
#' The functions can be used to programmatically move or delete data files.
#' 
#' @param name 
#'   Name of the data file one want to move or delete (without extension)
#' @param subdir
#'   Subdirectory of the data file. It can also be indicated directly in the 
#'   \code{name} parameter.
#' @param newDir
#'   Subdirectory where to move a data file
#'   
#' @examples 
#' \dontrun{
#' x <- rnorm(100)
#' 
#' prSave("x")
#' 
#' prMoveData("x", "testdir")
#' 
#' prDeleteScript("testdir/x")
#' 
#' }
#'
#' @seealso 
#' \code{\link{prScript}}
#' 
#' @export
prMoveData <- function(name, newDir, subdir = ".") {
  .prMoveFile(name, newDir, subdir, "rda", "data", "Data file")
}

#' @rdname prMoveData
#' @export
prDeleteData <- function(name, subdir = ".") {
  .prDeleteFile(name, subdir, "rda", "data")
}


