prPng <- function(name, theme = "white") {
  file <- sprintf("output/%s.png", name)
  png(file, 1024, 768, pointsize = 18)
  if(theme == "black") {
    par(bg = "black", col = "white",fg = "white", 
        col.axis = "white", col.lab = "white", 
        col.main = "white" , lwd = 2)
  } else {
  	par(lwd = 2)
  }
}

prPdf <- function(name) {
  file <- sprintf("output/%s.pdf", name)
  pdf(file, 14.2, 10.7, pointsize = 18)
}