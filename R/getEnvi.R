#' Get directory structure as nested list
#'
#' @description Reproduces a system folder structure as a nested list
#' 
#' @param root_folder root directory of the project
#' 
#' @return A list containing the directory structure
#' 
#' @name getEnvi
#' @export getEnvi
#' 
#' @author Marvin Ludwig
#' 
#' @examples 
#' \dontrun{
#' 
#' p <- getEnvi("~/project/")
#' p$here
#' p$data$here
#' 
#' }
#'
#'

getEnvi <- function(root_folder){
  # add last "/" if necessary
  if(substr(root_folder, nchar(root_folder), nchar(root_folder)) != "/"){
    root_folder <- paste0(root_folder, "/")
  }
  # get sub directories
  d <- list.dirs(substr(root_folder, 1, nchar(root_folder)-1), recursive = TRUE, full.names = TRUE)
  # save directory paths
  df <- data.frame(here = paste0(d, "/"), stringsAsFactors = FALSE)
  # set up file tree
  df$pathString <- paste0(root_folder, gsub(pattern = "/", ";", substr(d, start = nchar(root_folder), stop = nchar(d))))
  dn <- data.tree::as.Node(df, pathName = "pathString", pathDelimiter = ";")
  # convert to nested list with directory paths as values
  dl <- as.list(dn, childrenName = "here")
  # delete redundant name
  dl$name <- NULL
  
  return(dl)
}