#' Load and install libraries
#' 
#' The function tries to load all libraries passed as argument. For those that
#' are not installed, it tries to install them and then load them.
#' 
#' @param ...
#' name of the libraries to load. The names need to be quoted. If a package is
#' missing, the function tries to install it from CRAN by defaults. If a package 
#' needs to be installed from github, it can be declared with the following format:
#' \code{"github:username/pkgname"}. This way, if the package is not installed,
#' the function knows how to install it.
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
    available <- .loadPkg(p)
    
    if(available) {
      loadedPackages <- append(loadedPackages, basename(p))
    } else {
      message("Trying to install ", p)
      
      if (grepl("^github:", p)) {
        p <- gsub("^github:", "", p)
        try(devtools::install_github(p, quiet = TRUE), silent = TRUE)
      } else {
        suppressWarnings(utils::install.packages(p, quiet = TRUE))
      }
      
      installed <- .loadPkg(p)
      
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

# Private function that silently tries to load a package. Returns TRUE id the
# packages has been loaded.
.loadPkg <- function(p) {
  suppressWarnings(require(basename(p), character.only = TRUE, quietly=TRUE))
}
