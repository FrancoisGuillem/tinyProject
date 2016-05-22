# Load base packages
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(stats)
library(utils)

library(project)

# Source scripts with prefix "tools"
tools <- list.files("scripts")
tools <- tools[grep("^tools.*\\.R$", tools)]

if(length(tools) > 0) {
  sapply(sprintf("scripts/%s",tools), source)
}
rm(tools)

# Source "start.R" script
source("scripts/start.R")
