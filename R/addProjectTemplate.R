#' Create A Custom Project Template
#' 
#' This function can be used by package developer to add their own project
#' template to a package they are developing.
#' 
#' @param packageName Name of the package
#' 
#' @return Used for side effects.
#' 
#' @export
#' 
addProjectTemplate <- function(packageName, overwrite = FALSE) {
  if (! file.exists("inst/rstudio/templates/project")) {
    dir.create("inst/rstudio/templates/project", recursive = TRUE)
  }

  basepath <- system.file(".", package = "tinyProject")
  file.copy(file.path(basepath, "scriptTemplates"), "inst",
            recursive = TRUE, overwrite = overwrite)
  file.copy(file.path(basepath, "rstudio"), "inst", overwrite = overwrite)
  file.copy(file.path(basepath, "Rprofile.brew"), "inst", overwrite = overwrite)
  if (!file.exists("R/tinyProject.R") || overwrite) {
    brew::brew(file.path(basepath, "projectTemplate/tinyproject.brew"), 
               "R/tinyProject.R")
  }
  
  brew::brew(
    file.path(basepath, "projectTemplate/rstudio_template.brew"),
    sprintf("inst/rstudio/templates/project/%s.dcf", packageName)
  )
  
  # Add tinyProject in DESCRIPTION file
  if (!requireNamespace("usethis")) {
    warning("Package 'usethis' is not installed. You need to manually add 'tinyProject' in the 'Imports' section of the to the DESCRIPTION file")
  } else {
    usethis::use_package("tinyProject", min_version = "0.7.0")
  }
}
