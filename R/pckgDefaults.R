#' Create look-up table data for defining environment defaults
#'
#' @details After changing something update environment
#'
#' @return A list containing the default project settings.
#'
#' @keywords internal
#'
#' @author Christoph Reudenbach, Thomas Nauss
#'
#' @examples
#' \dontrun{
#' pckgDefaults()
#'}

pckgDefaults = function(){

  dflt = list(

    root_folder = "~/proj",

    folders = c("data", "run",
                "docs", "log"),



    path_prefix = "path_",

    global = FALSE,

    libs = NULL,

    alt_env_id = "COMPUTERNAME",
    alt_env_value = "PCRZP",
    alt_env_root_folder = "F:\\BEN\\edu"

  )


}
