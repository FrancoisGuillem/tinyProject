#' Create look-up table data for defining environment defaults
#'
#' @details After changing something, run [lutUpdate()] to update the LUT.
#'
#' @return A list containing the default project settings.
#'
#' @keywords internal
#'
#' @author Christoph Reudenbach, Thomas Nauss
#'
#' @examples
#' \dontrun{
#' lutUpdate()
#'}

pckgDefaults = function(){

  dflt = list(

    root_folder = "~/proj",

    folders = c("data", "data/tmp",
                "doc", "log"),

    git_subfolders = c("src", "doc", "fcts"),

    path_prefix = "path_",

    global = FALSE,

    libs = NULL,

    fcts_folder = "fcts",

    alt_env_id = "COMPUTERNAME",
    alt_env_value = "PCRZP",
    alt_env_root_folder = "D:\\BEN\\plygrnd"

  )

  devtools::use_data(dflt, overwrite = TRUE, internal = TRUE)
}
