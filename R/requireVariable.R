#' Ask user the value of a variable
#'
#' In interactive mode, this functions asks the user to type the value of a given
#' variable. In non-interactive mode, it searchs the value in the command line
#' arguments and it returns an error if the value does not exist.
#'
#' @param name Name of the required variable
#' @param desc Description to display
#' @param default Default value for the variable
#' @param what Type of data to read in interactive mode.
#' @param nmax Number of values to read in interactive mode.
#' @param alwaysAsk If the variable already exists, should the function ask a
#'   new value?
#' @param env Environment where the variable should be defined
#'
#' @return Used for side effects
#' @author Francois Guillem
#' @export
requireVariable <- function(name, desc = NULL,
                            default = NULL,
                            what = character(), nmax = 1, alwaysAsk = TRUE, env = .GlobalEnv) {
  if (interactive()) {
    if (!exists(name) || alwaysAsk) {
      cat("Enter value for variable", name)
      if (!is.null(default)) {
        cat(" ( default:", as.character(default), ")")
      }
      cat(":\n")
      if (!is.null(desc)) cat("(", desc, ")\n")
      value <- scan(what = what, nmax = nmax)
      if (length(value) == 0) {
        if (!is.null(default)) value <- default
        else stop ("Missing value for variable ", name)
      }
      assign(name, value, envir = env)
    }
  } else {
    # Read value from command args
    assign(name, getCommandArg(name, default, desc), envir = env)
  }
}
