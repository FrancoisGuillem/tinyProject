#' create and/or open R scripts
#' 
#' \code{prScript} creates and opens a new script for edition. If the script
#' already exists, it opens it in the Rstudio editor.
#' 
#' @param name
#'   (optional) name of the script to create and/or open. This parameter can also include
#'   the subfolder where to save the script (see examples).
#' @param template
#'   (Optional) One of "analysis", "data" or "function". Template to use for the
#'   creation of a script. \code{prScript} adds a few comments that encourage the user to add
#'   comments and explain what the script will do. These comments depend on the
#'   choosen template. If the argument is missing, the choosen template depends
#'   on the name of the script: "data" if the name begins with "data", "function"
#'   if it start with "tools" and "analysis" in all other cases.
#' @param subdir
#'   subdirectory where the scripts needs to be created or opened. The 
#'   subdirectory can also be directly specified in the parameter \code{name}.
#' @param instructions Should the created script include some instructions?
#'   
#' @details 
#' If the parameter \code{name} is missing, then a list of existing scripts is
#' displayed. The user is then invited to choose one by typing the number or 
#' name of the script he wants to open.
#' 
#' @seealso 
#' \code{\link{prSource}}, \code{\link{prMoveScript}}, \code{\link{prRenameScript}}, 
#' \code{\link{prDeleteScript}}
#' 
#' @examples
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' prScript("test")
#' list.files(projectPath, recursive = TRUE, include.dirs = TRUE)
#' 
#' prScript("myFunction", template = "function")
#' 
#' # Create script in a subfolder
#' prScript("test", subdir = "testdir")
#' 
#' # Or equivalently
#' prScript("testdir/test")
#' 
#' @export
#' 
prScript <- function(name, template = NULL, subdir = ".", instructions = TRUE) {
  # If parameter 'name' is missing, interactively choose a script
  if(missing(name)) {
  	files <- .lsScripts()
  	print(files)
  	cat("Enter the number or the name of the script you want to open:\n")
  	i <- type.convert(scan(n = 1, what=character()))
    if (is.numeric(i)) {
      if (!i > 0 & i < nrow(files)) stop("Invalid script number.")
      name <- files[i, "Script"]
    } else {
      name <- i
    }
  }
  
  path <- .getPath(name, subdir, "R", "scripts")
  
  # If script does not exist, create it
  if(!file.exists(path)) {
    templatePath <- .prTemplate(name, template)
    brew::brew(templatePath, path)
  }
  
  if (interactive()) file.edit(path)
}


#' Move, rename and delete scripts
#' 
#' These functions can be used to pragrammatically move, rename and delete 
#' scripts files.
#' 
#' @param name 
#'   Name of the script on which one wants to perform an action.
#' @param subdir
#'   Subdirectory of the script on which one wants to perform an action. It can 
#'   also be indicated directly in the \code{name} parameter.
#' @param newDir
#'   Subdirectory where to move a script.
#' @param newName
#'   New name of the script.
#'   
#' @examples 
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' prScript("test")
#' 
#' prMoveScript("test", "testdir")
#' 
#' prRenameScript("testdir/test", "myTest")
#' 
#' prDeleteScript("testdir/myTest")
#' 
#'
#' @seealso 
#' \code{\link{prScript}}
#' @export
prMoveScript <- function(name, newDir, subdir = ".") {
  .prMoveFile(name, newDir, subdir, "R", "scripts", "Script")
}


#' @rdname prMoveScript
#' @export
prRenameScript <- function(name, newName, subdir = ".") {
  path <- .getPath(sprintf("scripts/%s/%s.R", subdir, name), create = FALSE)
  newPath <- .getPath(sprintf("scripts/%s/%s.R", dirname(file.path(subdir, name)), newName))
  
  if (file.exists(newPath)) stop("Script ", name, "already exists.")
  
  file.rename(path, newPath)
}


#' @rdname prMoveScript
#' @export
prDeleteScript <- function(name, subdir = ".") {
  .prDeleteFile(name, subdir, "R", "scripts")
}



#' private function that list scripts in the 'script' folder.
#' 
#' @return 
#' For now, a data.frame with a single column 'Script'. Other information could
#' be added in this data.frame
#' 
#' @noRd
.lsScripts <- function() {
  files <- list.files(.getPath("scripts"), recursive = TRUE, pattern = "\\.R$")
  files <- gsub("\\.R$","", files)
  data.frame(Script = files)
}



#' Source a R script
#' 
#' Source a R script in the "scripts" folder of the project.
#' 
#' @param name
#'   Name of the script to execute. It can also contain the subfolder where the
#'   script is stored.
#' @param subdir
#'   subdirectory where the script is located. The 
#'   subdirectory can also be directly specified in the parameter \code{name}.
#'   
#' @seealso 
#' \code{\link{prLibrary}}, \code{\link{prLoad}}, \code{\link{prSave}}
#' 
#' @examples 
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' prScript("helloWorld")
#' 
#' # Edit the script so that it does something cool
#' 
#' prSource("helloWorld")
#' 
#' # Source a file in a subdirectory
#' prScript("myScript", subdir = "testdir")
#' prSource("myScript", subdir = "testdir")
#' 
#' # Or equivalently
#' prSource("testdir/myScript")
#' 
#' @export   
prSource <- function(name, subdir = ".") {
  path <- sprintf("scripts/%s/%s.R", subdir, name)
  source(.getPath(path, create = FALSE))
}
