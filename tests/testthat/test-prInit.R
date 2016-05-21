context("Function prInit")

dir <- tempdir()
setwd(dir)

if (dir.exists("project-test")) unlink("project-test", recursive = TRUE)
dir.create("project-test")
setwd("project-test")

prInit()

test_that("prInit creates folders and files", {
  expect_true(dir.exists("data"))
  expect_true(dir.exists("scripts"))
  expect_true(dir.exists("output"))
  expect_true(file.exists(".Rprofile"))
  expect_true(file.exists("scripts/start.R"))
  expect_true(file.exists("scripts/data.R"))
  expect_true(file.exists("scripts/main.R"))
})