prScript <- function(name, template=c("analysis", "data", "function"), subdir = ".") {
  template <- match.arg(template[1], 
                        c("analysis", "data", "function", "main", "start"))
  
  # If parameter 'name' is missing, interactively choose a script
  if(missing(name)) {
  	files <- .lsScripts()
  	print(files)
  	cat("Enter the number or the name of the script you want to open:\n")
  	i <- type.convert(scan(n = 1, what=character()))
    if (is.numeric(i)) {
      if (!i > 0 & i < nrow(files)) stop("Invalid script number.")
      name <- files[i, "Script"]
    } else {
      name <- i
    }
  }
  
  # Relative path of the script to create/edit
  path <- sprintf("scripts/%s/%s.R", subdir, name)
  
  # If script does not exist, create it
  if(!file.exists(path)) {
    # If the folder does not exists, create it
    dir <- dirname(path)
    if (!dir.exists(dir)) dir.create(dir, recursive = TRUE)
    
    # Create the file according to a template
    templatePath <- system.file(sprintf("scriptTemplates/%s.brew", template), 
                                package = "project")
    brew(templatePath, path)
    
  }
  file.edit(path)
}

#' private function that list scripts in the 'script' folder.
#' 
#' @return 
#' For now, a data.frame with a single column 'Script'. Other information could
#' be added in this data.frame
#' 
#' @noRd
.lsScripts <- function() {
  files <- list.files("scripts", recursive = TRUE)
  files <- files[str_detect(files, "\\.R$")]
  files <- str_replace(files, "\\.R$","")
  data.frame(Script = files)
}


prSource <- function(name, subdir = ".") {
  sprintf("scripts/%s/%s.R", subdir, name)
  
  path <- sprintf("scripts/%s.R", name)
  source(path)
}
