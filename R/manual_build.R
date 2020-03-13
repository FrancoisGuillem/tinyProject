#' CLI based build of packages
#'
#' @description CLI based build of packages in network based R environments
#'
#' @param dsn root directory of the package that is build by default the current wd
#' @param pkgDir the package library home directory
#'
#' @name manuallyBuild
#' @export manuallyBuild
#'
#' @author Christoph Reudenbach, Florian Detsch
#'
#' @examples
#' \dontrun{
#' manuallyBuild()
#'}


manuallyBuild <- function(dsn = getwd(), pkgDir="H:/Dokumente",document = TRUE, ...) {

  ## reset 'dsn' to 'H:/...'
  if (length(grep("students_smb", dsn)) > 0) {
    lst_dsn <- strsplit(dsn, "/")
    chr_dsn <- unlist(lst_dsn)[3:5]
    dsn <- paste0("H:/", paste(chr_dsn, collapse = "/"))
  }

  ## if 'document = TRUE', create documentation
  if (document) {
    cat("\nCreating package documentation...\n")
    roxygen2::roxygenize(package.dir = dsn,
                         roclets = c('rd', 'collate', 'namespace'))
  }

  ## build package
  cat("\nBuilding package...\n")

  devtools::build(pkg = dsn, path = dirname(dsn), ...)


  ## install package
  cat("Installing package...\n")
  pkg <- list.files(dirname(pkgDir), full.names = TRUE,
                    pattern = paste0(basename(dsn), ".*.tar.gz$"))
  pkg <- pkg[length(pkg)]

  utils::install.packages(pkg, repos = NULL)

  return(invisible(NULL))
}
