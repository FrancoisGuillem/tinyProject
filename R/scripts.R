script <- function(name, template="analysis") {
  if(missing(name)) {
  	files <- lsScripts()
  	print(files)
  	cat("Enter the number or the name of the script you want to open :\n")
  	i <- type.convert(scan(n = 1, what=character()))
    if (is.numeric(i)) {
      name <- files[i, "Script"]
    } else {
      name <- i
    }
  }
  path <- sprintf("scripts/%s.R",
                   name)
  if(!file.exists(path)) {
    brew(system.file(sprintf("scriptTemplates/%s.brew", template),
                     package = "project"), 
         path)
    
  }
  file.edit(path)
}

lsScripts <- function() {
  files <- list.files("scripts")
  files <- files[str_detect(files, "\\.R$")]
  files <- str_replace(files, "\\.R$","")
  data.frame(Script = files)
}

prSource <- function(name) {
  path <- sprintf("scripts/%s.R", name)
  source(path)
}
