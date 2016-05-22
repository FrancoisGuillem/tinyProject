#' Initialise a project
#'
#' \code{prInit} should be used in a Rstudio project. The function creates
#' the basic structure of a data analysis project that will help you keep your
#' your work organised and increase your productivity.
#' 
#' @details 
#' The function creates three folders :
#' 
#' \itemize{
#'   \item scripts: Folder where the scripts are stored
#'   \item data: Folder where the source and intermediate data files are stored
#'   \item output: Folder where the output of the project are stored
#' }
#' 
#' These three folders are essential so do not remove them. But you can add any
#' other folders you desire ("latex", "presentation", etc.)
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
#'   should load the libraries used in the project, define constant values, ... 
#'   More generally it should include all technical instructions that do not
#'   directly participate to the creation, manipulation or analysis of data.
#' }
#' 
#' @seealso 
#' \code{\link{prLibrary}}, \code{\link{prSource}}, \code{\link{prSave}}, 
#' \code{\link{prLoad}}, \code{\link{prScript}}
#' 
#' @examples 
#' \dontrun{
#' # First create an empty project with Rstudio
#' 
#' prInit()
#' 
#' }
#' 
#' @export
#' 
prInit <- function() {
  # Project Name
  project <- basename(getwd())
  
  # Create directories and scripts if they do not exist
  dirCreate <- function(x) {
    if(! file.exists(x)) dir.create(x) else warning("Directory '", x, "' already exists.")
  }
  dirCreate ("data")
  dirCreate ("output")
  dirCreate ("scripts")

  prScript("data", template = "data")
  prScript("main", template = "main")
  prScript("start", template = "start")
  
  file.copy(system.file("Rprofile", package = "project"), "./.Rprofile")
}


#' Load and install libraries
#' 
#' The function tries to load all libraries passed as argument. For those that
#' are not installed, it tries to install them and then load them.
#' 
#' @param ...
#' name of the libraries to load. The names need to be quoted.
#' 
#' @seealso 
#' \code{\link{prSource}}
#' 
#' @examples 
#' prLibrary("data.table", "plyr")
#' 
#' @export
#' 
prLibrary <- function(...) {
  packages <- unlist(list(...))
  for (p in packages) {
    if(!suppressWarnings(require(p, character.only = TRUE, quietly=TRUE))) {
      try(utils::install.packages(p))
      require(p, character.only = TRUE, quietly = TRUE)
    }
  }
}