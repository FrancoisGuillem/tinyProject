.onLoad <- function (lib, pkg) { 
  options("projectHome" = getwd())
}

.Last <- function() {
 closeProject()
}