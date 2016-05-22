library(project)

tools <- list.files("scripts")
tools <- tools[grep("^tools.*\\.R$", tools)]

if(length(tools) > 0) {
  sapply(sprintf("scripts/%s",tools), source)
}
rm(tools)

source("scripts/start.R")
