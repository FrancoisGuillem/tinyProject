#' Initialise a project
#'
#' \code{prInit} should be used in a Rstudio project. The function creates
#' the basic structure of a data analysis project that will help you keep your
#' your work organised and increase your productivity.
#' 
#' @param dir Directory where project files will be stored. By default, it is 
#'   the current working directory.
#' @param instructions Should instructions be added in the scripts created by the
#'   the function?
#' @param dataDir Name of the folder where data will be saved.
#' @param scriptDir Name of the folder that will contain R scripts.
#' @param outputDir Name of the folder where output files will be saved.
#' @param otherDirs Other directories to create.
#' @param scripts Named vector. For each element of this vector, the function
#'   generate a script. The name of each element corresponds to the name of the
#'   script to create, the value corresponds to the template to use.
#' @param autoSource character vector containing regular expressions. All scripts
#'   whose name match these pattern are automatically executed at project start-up.
#' 
#' @details 
#' By default, the function creates three folders :
#' 
#' \itemize{
#'   \item scripts: Folder where the scripts are stored
#'   \item data: Folder where the source and intermediate data files are stored
#'   \item output: Folder where the output of the project are stored
#' }
#' 
#' These three folders are essential so do not remove them. But you can add any
#' other folders you desire ("latex", "python", "presentation", etc.) manually
#' or with argument `otherDirs`.
#' 
#' Additionally, three scripts are created:
#' 
#' \itemize{
#'   \item main.R: This is the main script of your project. Ideally, just by 
#'   looking at this script you should remember how your project is organised
#'   For small projects most code can go in this script. But for larger project, 
#'   it should mostly contain comments what each script is supposed to do. You 
#'   can use the function \code{\link{prScript}} to programatically open the 
#'   scripts you are referring to.
#'   
#'   \item data.R: This script should contain inscruction to import data in the
#'   project and/or transform the source data in processed data that will be
#'   studied/analysed. As for the script "main", for large project, this script
#'   should not contain code, but make reference to the scripts that do the job.
#'   
#'   \item start.R: script that is executed every time the project is opened. It
#'   should load the packages used in the project, define constant values, ... 
#'   More generally it should include all technical instructions that do not
#'   directly participate to the creation, manipulation or analysis of data.
#' }
#' 
#' @seealso 
#' \code{\link{prLibrary}}, \code{\link{prSource}}, \code{\link{prSave}}, 
#' \code{\link{prLoad}}, \code{\link{prScript}}
#' 
#' @examples 
#' projectPath <- file.path(tempdir(), "test")
#' prInit(projectPath)
#' 
#' list.files(tempdir(), recursive = TRUE, include.dirs = TRUE)
#' 
#' @export
#' 
prInit <- function(dir = ".", instructions = TRUE, scriptDir = "scripts", 
                   dataDir = "data", outputDir = "output", otherDirs = character(),
                   scripts = c(data = "data", main = "main", start = "start"),
                   autoSource = c("^tools.*$", "^start$")) {
  
  options(
    prDir = list(
      data = dataDir,
      scripts = scriptDir,
      output = outputDir
    ),
    prAutoSource = autoSource
  )
  
  # Create directories and scripts if they do not exist
  dirCreate <- function(x) {
    x <- file.path(dir, x)
    if(! file.exists(x)) dir.create(x) else warning("Directory '", x, "' already exists.")
  }
  
  if (dir != ".") dirCreate("")
  
  dirCreate (dataDir)
  dirCreate (scriptDir)
  dirCreate (outputDir)
  for (d in otherDirs) {
    dirCreate(d)
  }

  if (!is.null(packageDescription("tinyProject")$Date)) {
    pkgDate <- as.Date(packageDescription("tinyProject")$Date) + 1
  } else {
    pkgDate <- as.character(Sys.Date())
  }
  brew::brew(system.file("Rprofile.brew", package = "tinyProject"), 
             file.path(dir,"./.Rprofile"))
  
  options(projectRoot = normalizePath(dir))
  
  scriptNames <- names(scripts)
  scriptTemplates <- unname(scripts)
  
  for (i in seq_along(scriptNames)) {
    prScript(scriptNames[i], template = scriptTemplates[i], 
             instructions = instructions)
  }
}
