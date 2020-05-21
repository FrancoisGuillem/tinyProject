#' Register a new script template
#' 
#' @description
#' Script templates are used by function [prScript()] to create new scripts. 
#' This function can be used to register new script templates. It is 
#' especially useful to create custom project templates.
#' 
#' Template files are processed with function [brew::brew()], so you can 
#' use the `brew` syntax to insert some dynamic content in your scripts. 
#' 
#' @param name Name of the template. You can overhide a template by registering
#'   a template with the same name.
#' @param path Path of the template file
#' @param pattern Regular expression. If user does not explicitely choose a 
#'   template, but the script path matches this regular expression, then the
#'   corresponding template is used.
#' @param default If `TRUE` then this template will be the default template
#' 
#' @return This function is only used for side effects and does not return
#'   anything.
#' 
#' @export
prRegisterTemplate <- function(name, path, pattern = "", default = FALSE) {
  templates <- getOption("prTemplates")
  
  newTemplate <- data.frame(
    name = name,
    path = path, 
    pattern = pattern,
    default = default,
    stringsAsFactors = FALSE
  )
  
  options(prTemplates = rbind(newTemplate, templates))
  invisible()
}

.prTemplate <- function(path, template = NULL) {
  templates <- getOption("prTemplates")
  
  if (is.null(template)) {
    templateRow <- min(which(templates$default))
    for (i in 1:nrow(templates)) {
      if (templates$pattern[i] != "" && grepl(templates$pattern[i], path)) {
        templateRow <- i
        break
      }
    }
  } else {
    templateRow <- match(template[1], templates$name)
    if (is.na(templateRow)) {
      stop("'template' should be one of ", 
           paste(unique(templates$name), collapse = ", "))
    }
  }
  templates$path[templateRow]
}
