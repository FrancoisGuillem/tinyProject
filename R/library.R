#' Load and install packages
#' 
#' The function tries to load all packages passed as argument. For those that
#' are not installed, it tries to install them and then load them.
#' 
#' @param ... name of the packages to load. The names need to be quoted. If a
#'   package is missing, the function tries to install it from CRAN by defaults.
#'   If a package needs to be installed from github, it can be declared with the
#'   following format: \code{"github:username/pkgname"}. This way, if the
#'   package is not installed yet, the function knows how to install it.
#' @param warnings Should the function display warnings?
#'   
#' 
#' @seealso 
#' \code{\link{prSource}}
#' 
#' @examples 
#' \dontrun{
#' prLibrary(data.table, plyr)
#' }
#' 
#' @export
#' 
prLibrary <- function(..., warnings = FALSE) {
  packages <- sapply( substitute(list(...)), .getName )[-1] 
  missingPackages <- c()
  installedPackages <- c()
  loadedPackages <- c()
  
  repos <- getOption("repos")
  if (is.null(repos) || !grepl("^http", repos)) repos <- getOption("prDefaultRepos")

  # Load packages. If they are not installed, try to install them
  for (p in packages) {
    available <- .loadPkg(p, warnings)
    
    if(available) {
      loadedPackages <- append(loadedPackages, basename(p))
    } else {
      message("Trying to install ", p)
      
      Sys.setenv(R_PROFILE_USER = "")
      if (grepl("^github:", p)) {
        p <- gsub("^github:", "", p)
        if (requireNamespace("remotes")) {
          try(remotes::install_github(p, quiet = TRUE), silent = TRUE)
        } else {
          warning("Installing github packages requires the 'remotes' package")
        }
      } else {
        suppressWarnings(utils::install.packages(p, quiet = TRUE, repos = repos))
      }
      Sys.unsestenv("R_PROFILE_USER")
      
      installed <- .loadPkg(p, warnings)
      
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
.loadPkg <- function(p, warnings = FALSE) {
  if (warnings) {
    require(basename(p), character.only = TRUE, quietly=TRUE)
  } else {
    suppressWarnings(require(basename(p), character.only = TRUE, quietly=TRUE, warn.conflicts = FALSE))
  }
}
