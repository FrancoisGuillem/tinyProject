script <- function(name, project= ".") {
  if(missing(name)) {
  	files <- lsScripts()
    names(files) <- files
  	print(files)
  	cat("Choix :\n")
  	i <- scan(n = 1)
  	name <- files[i]
  }
  path <- sprintf("%s/scripts/%s.R",
                   project,
                   name)
  if(!file.exists(path)) {
    file.create(path)
    cat(sprintf("#///////////////////////////////////////////////////////////////////////////////
# %s %s
#///////////////////////////////////////////////////////////////////////////////
# Objectif:
#
# Démarche:
#
# Résultats:
#
#
#///////////////////////////////////////////////////////////////////////////////
",              ifelse(name == "main", "PROJECT", "SCRIPT"), 
                ifelse(name == "main", project, name)), file = path)
  }
  file.edit(path)
}

lsScripts <- function() {
  files <- list.files("scripts")
  files <- gsub(".R$","", files)
  files
}

prSource <- function(name, project= ".") {
  path <- sprintf("%s/scripts/%s.R", 
                   project,
                   name)
  source(path)
}
