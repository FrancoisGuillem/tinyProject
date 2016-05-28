prWriteTable <- function(name, ..., replace = FALSE) {
  if (!is.character(name) || length(name) > 1) 
    stop("Argument 'name' should be a character vector of length one. Have you forgotten quotes ?")
  
  path <- .getPath(name, ".", "txt", "output", stopIfExists = !replace)
  
  x <- get(basename(name))
  write.table(x, file = path, ...)
}