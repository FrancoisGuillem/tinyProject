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
  packages <- unique(c(...))
  missingPackages <- c()
  installedPackages <- c()
  loadedPackages <- c()
  
  # Load packages. If they are not installed, try to install them
  for (p in packages) {
    available <- suppressWarnings(require(basename(p), character.only = TRUE, 
                                          quietly=TRUE))
    
    if(available) {
      loadedPackages <- append(loadedPackages, basename(p))
    } else {
      message("Trying to install ", p)
      suppressWarnings(utils::install.packages(p, quiet = TRUE))
      installed <- suppressWarnings(require(p, character.only = TRUE, 
                                            quietly = TRUE))
      
      if (installed) {
        installedPackages <- append(installedPackages, basename(p))
        loadedPackages <- append(loadedPackages, basename(p))
      } else {
        missingPackages <- append(missingPackages, basename(p))
      }
    }
  }
  
  # Print diagnostic messages
  if (length(loadedPackages) > 0) {
    cat("Loaded packages:", paste(loadedPackages, collapse = ", "), "\n")
  } else {
    cat("No package has been loaded.\n")
  }
  
  if (length(installedPackages) > 0) {
    cat("The following packages have been installed:", 
        paste(installedPackages, collapse = ", "), "\n")
  }
  
  if (length(missingPackages) > 0) {
    cat("The following packages could not be installed:", 
        paste(missingPackages, collapse = ", "), "\n")
  }
  
}