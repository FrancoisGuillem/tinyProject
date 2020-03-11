#' Define basic or alternative environment depending on actual system
#'
#' @description Defines the basic environment settings depending on the
#' actual system environment.
#'
#' @param root_folder root directory of the project.
#' @param alt_env_id alternative system environment attribute used to
#' check for setting an alternative \code{root_folder}.
#' @param alt_env_value value of the attribute for which the alternative
#' root directory of the project should be set.
#' @param alt_env_root_folder alternative root directory.
#'
#' @return  Root folder name.
#'
#' @name alternativeEnvi
#' @export alternativeEnvi
#'
#' @author Christoph Reudenbach, Thomas Nauss
#'
#' @seealso [createEnvi()]
#'
#' @examples
#' \dontrun{
#' alternativeEnvi(root_folder = tempdir(), alt_env_id = "COMPUTERNAME",
#' alt_env_value = "PCRZP", alt_env_root_folder = "D:\\BEN\\edu")
#'}

alternativeEnvi = function(root_folder = tempdir(),
                      alt_env_id = NULL,
                      alt_env_value = NULL,
                      alt_env_root_folder = NULL){

  root_folder = gsub("\\\\", "/", path.expand(root_folder))

  if(!is.null(alt_env_id)){
    if(grepl(alt_env_value, Sys.getenv()[alt_env_id])){
      root_folder = alt_env_root_folder
    }
  }

  return(root_folder)
}
