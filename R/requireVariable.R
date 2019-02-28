#' Ask user the value of a variable
#' 
#' In interactive mode, this functions asks the user to type the value of a given
#' variable. In non-interactive mode, it searchs the value in the command line
#' arguments and it returns an error if the value does not exist.
#' 
#' @param name Name of the required variable
#' @param desc Description to display
#' @param what Type of data to read in interactive mode.
#' @param nmax Number of values to read in interactive mode.
#' @param alwaysAsk If the variable already exists, should the function ask a
#'   new value? 
#' 
#' @return Used for side effects
#' 
#' @export
requireVariable <- function(name, desc = paste("Enter value for variable", name), 
                            what = character(), nmax = 1, alwaysAsk = TRUE) {
  if (interactive()) {
    if (!exists(name) || alwaysAsk) {
      cat(desc, '\n')
      value <- scan(what = what, nmax = nmax)
      assign(name, value, envir = .GlobalEnv)
    }
  } else {
    # Read value from command args
  }
}