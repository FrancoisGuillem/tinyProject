#' create and/or open R scripts
#' 
#' \code{prScript} creates and opens a new script for edition. If the script
#' already exists, it opens it in the Rstudio editor.
#' 
#' @param name
#'   (optional) name of the script to create and/or open. This parameter can also include
#'   the subfolder where to save the script (see examples).
#' @param template
#'   One of "analysis", "data" or "function". For new scripts, template to use.
#'   prScript adds a few comments that encourage you to add comments and explain
#'   what the script will do. These comments depend on the choosen template.
#' @param subdir
#'   subdirectory where the scripts needs to be created or opened. The 
#'   subdirectory can also be directly specified in the parameter \code{name}.
#'   
#' @details 
#' If the parameter \code{name} is missing, then a list of existing scripts is
#' displayed. The user is then invited to choose one by typing the number or 
#' name of the script he wants to open.
#' 
#' @seealso 
#' \code{\link{prSource}}
#' 
#' @examples
#' \dontrun{
#' 
#' prScript("test")
#' 
#' prScript("myFunction", template = "function")
#' 
#' # Create script in a subfolder
#' prScript("test", subdir = "testdir")
#' 
#' # Or equivalently
#' prScript("testdir/test")
#' }
#' 
#' @export
#' 
prScript <- function(name, template=c("analysis", "data", "function"), subdir = ".") {
  template <- match.arg(template[1], 
                        c("analysis", "data", "function", "main", "start"))
  
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
  
  # Relative path of the script to create/edit
  path <- sprintf("scripts/%s/%s.R", subdir, name)
  
  # If script does not exist, create it
  if(!file.exists(path)) {
    # If the folder does not exists, create it
    dir <- dirname(path)
    if (!dir.exists(dir)) dir.create(dir, recursive = TRUE)
    
    # Create the file according to a template
    templatePath <- system.file(sprintf("scriptTemplates/%s.brew", template), 
                                package = "project")
    brew(templatePath, path)
    
  }
  file.edit(path)
}

#' private function that list scripts in the 'script' folder.
#' 
#' @return 
#' For now, a data.frame with a single column 'Script'. Other information could
#' be added in this data.frame
#' 
#' @noRd
.lsScripts <- function() {
  files <- list.files("scripts", recursive = TRUE)
  files <- files[str_detect(files, "\\.R$")]
  files <- str_replace(files, "\\.R$","")
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
#' \dontrun{
#' 
#' prScript("helloWorld")
#' 
#' # Edit the script so that it does something cool
#' 
#' prSource("helloWorld")
#' 
#' # Source a file in a subdirectory
#' prSource("myScript", subdir = "testdir")
#' 
#' # Or equivalently
#' prSource("testdir/myScript")
#' }
#'   
prSource <- function(name, subdir = ".") {
  path <- sprintf("scripts/%s/%s.R", subdir, name)
  source(path)
}
