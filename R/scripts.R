script <- function(name, template="analysis") {
  if(missing(name)) {
  	files <- lsScripts()
    names(files) <- files
  	print(files)
  	cat("Choix :\n")
  	i <- scan(n = 1)
  	name <- files[i]
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
  files <- gsub(".R$","", files)
  files
}

prSource <- function(name) {
  path <- sprintf("scripts/%s.R", name)
  source(path)
}
