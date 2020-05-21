#' @import grDevices
#' @importFrom methods formalArgs
#' @importFrom utils type.convert write.csv write.csv2 write.table packageDescription
#' 
NULL

globalVariables(c("file.edit"))

.onLoad <- function(libname, pkgname) {
  options(prTemplates = NULL)
  prRegisterTemplate(
    "analysis", 
    system.file("scriptTemplates/analysis.brew", package = "tinyProject"),
    default = TRUE
  )
  prRegisterTemplate(
    "data", 
    system.file("scriptTemplates/data.brew", package = "tinyProject"),
    pattern = "^data"
  )
  prRegisterTemplate(
    "function", 
    system.file("scriptTemplates/function.brew", package = "tinyProject"),
    pattern = "^tools"
  )
  prRegisterTemplate(
    "main", 
    system.file("scriptTemplates/main.brew", package = "tinyProject"),
  )
  prRegisterTemplate(
    "start", 
    system.file("scriptTemplates/start.brew", package = "tinyProject"),
  )
}
