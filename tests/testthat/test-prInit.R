context("Function prInit")

dir <- tempdir()
setwd(dir)

if (dir.exists("project-test")) unlink("project-test", recursive = TRUE)
dir.create("project-test")
setwd("project-test")

test_that("prInit creates folders and files", {
  expect_silent(prInit())
  expect_true(dir.exists("data"))
  expect_true(dir.exists("scripts"))
  expect_true(dir.exists("output"))
  expect_true(file.exists(".Rprofile"))
  expect_true(file.exists("scripts/start.R"))
  expect_true(file.exists("scripts/data.R"))
  expect_true(file.exists("scripts/main.R"))
})

test_that("The .Rprofile scripts can be sourced", {
  expect_silent(source(".Rprofile"))
})

test_that(".Rprofile runs start.R script", {
  cat("\nprint(\"Hello World\")\n", file = "scripts/start.R", append = TRUE)
  expect_output(source(".Rprofile"), "Hello World")
})

test_that(".Rprofile runs scripts with prefix 'tools'", {
  cat('print("Tools")\n', file = "scripts/toolsTest.R")
  expect_output(source(".Rprofile"), "Tools")
})