.prMoveFile <- function(name, newDir, subdir = ".", extension, mainDir, errorName) {
  path <- sprintf("%s/%s/%s.%s", mainDir, subdir, name, extension)
  
  newDir <- file.path(mainDir, newDir)
  newDir <- gsub("/.$", "", newDir)
  if (!dir.exists(newDir)) dir.create(newDir, recursive = TRUE)
  
  newPath <- sprintf("%s/%s.%s", newDir, basename(name), extension)
  
  if (file.exists(newPath)) stop(errorName, " ", newPath, "already exists.")
  
  file.rename(path, newPath)
}

.prDeleteFile <- function(name, subdir = ".", extension, mainDir) {
  path <- sprintf("%s/%s/%s.%s", mainDir, subdir, name, extension)
  file.remove(path)
}