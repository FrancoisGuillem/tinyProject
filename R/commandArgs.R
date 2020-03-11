readCommandArgs <- function() {
  args <- R.utils::cmdArgs()
  
  unnamed_args <- args[names(args) == ""]
  named_args <- args[names(args) != ""]
  
  args <- list(
    named = named_args,
    unnamed = unname(unnamed_args)
  )
  
  options(prArgs = args)
  
  args
}

getCommandArg <- function(name, default = NULL, desc = NULL) {
  args <- getOption("prAgrs")
  if (is.null(args)) {
    args <- readCommandArgs()
  }
  # check named parameters
  if (name %in% names(args$named)) return(args$named[[name]])
  
  # check unnamed parameters
  if (length(args$unnamed) > 0) {
    value <- args$unnamed[[1]]
    args$unnamed <- args$unnamed[-1]
    
    argToAdd <- list(value)
    names(argToAdd) <- name
    
    args$named <- append(args$named, argToAdd)
    
    options(prAgrs = args)
    
    return(value)
  }
  
  # Return default if set
  if (!is.null(default)) return(default)
  
  # Else error
  if (is.null(desc)) msg <- ""
  else msg <- paste("(", desc, ")")
  stop ("Missing value for parameter ", name, msg)
}




