#' Define and create a project environment
#'
#' @description Defines folder structures and creates them if necessary, loads
#' libraries, and sets other project relevant parameters.
#'
#' @param root_folder root directory of the project.
#' @param folders list of subfolders within the project directory.
#' @param folder_names names of the variables that point to subfolders. If not
#' provided, the base paths of the folders is used.
#' @param git_repository name of the project's git repository. Will be
#' added to the folders and subfolders defined in default envionment
#' @param git_subfolders subdirectories within git repository that should be
#' created.
#' @param path_prefix a prefix for the folder names.
#' @param global logical: export path strings as global variables?
#' @param libs  vector with the  names of libraries
#' @param alt_env_id alternative system environment attribute used to
#' check for setting an alternative \code{root_folder}.
#' @param alt_env_value value of the attribute for which the alternative
#' root directory of the project should be set.
#' @param alt_env_root_folder alternative root directory.
#' @param create_folders create folders if not existing already.
#'
#' @return A list containing the project settings.
#'
#' @name createEnvi
#' @export createEnvi
#'
#' @author Christoph Reudenbach, Thomas Nauss
#'
#' @seealso [alternativeEnvi()]
#'
#' @examples
#' \dontrun{
#' createEnvi(root_folder = "~/edu", folders = c("data/", "data/tmp/"),
#' libs = c("link2GI"),
#' alt_env_id = "COMPUTERNAME", alt_env_value = "PCRZP",
#' alt_env_root_folder = "D:\\BEN\\edu")
#'}

createEnvi = function(root_folder = tempdir(), folders = c("data", "data/tmp"),
                      folder_names = NULL, git_repository = NULL,
                      git_subfolders = c("src", "doc"),
                      path_prefix = "path_", global = FALSE,
                      libs = NULL,
                      alt_env_id = NULL,
                      alt_env_value = NULL,
                      alt_env_root_folder = NULL,
                      create_folders = TRUE){


  # Set root folder or alternative root folder
  root_folder = alternativeEnvi(root_folder = root_folder,
                                alt_env_id = alt_env_id,
                                alt_env_value = alt_env_value,
                                alt_env_root_folder = alt_env_root_folder)

  # Compile and create folders if necessary
  if(!is.null(git_repository)){
    folders = addGitFolders(folders = folders, git_repository = git_repository,
                            git_subfolders = git_subfolders)
  }
  folders = createFolders(root_folder, folders,
                          folder_names = folder_names, path_prefix = path_prefix,
                          create_folders = create_folders)

  # Set global environment if necessary
  if(global) makeGlobalVariable(names = names(folders), values = folders)



  return(folders)
}
