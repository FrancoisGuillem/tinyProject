context("Data management")

dir <- tempdir()
setwd(dir)

if (dir.exists("project-test")) unlink("project-test", recursive = TRUE)
dir.create("project-test")
setwd("project-test")

prInit()

test_that("One can save and load objects", {
  assign("x", rnorm(100), envir = .GlobalEnv)
  y <- x
  prSave("x")
  expect_true(file.exists("data/x.rda"))
  rm(x, envir = .GlobalEnv)
  expect_output(prLoad("x"), "Numeric vector 'x' has been loaded")
  expect_true(exists("x"))
  expect_equivalent(x, y)
})

test_that("One can save and load objects in subdirectories", {
  assign("x2", rnorm(100), envir = .GlobalEnv)
  y <- x2
  prSave("dir2/x2")
  expect_true(file.exists("data/dir2/x2.rda"))
  rm(x2, envir = .GlobalEnv)
  expect_output(prLoad("dir2/x2"), "Numeric vector 'x2' has been loaded")
  expect_true(exists("x2"))
  expect_equivalent(x2, y)
  
  assign("x3", rnorm(100), envir = .GlobalEnv)
  y <- x3
  prSave("x3", subdir = "dir3")
  expect_true(file.exists("data/dir3/x3.rda"))
  rm(x3, envir = .GlobalEnv)
  expect_output(prLoad("x3", subdir = "dir3"), "Numeric vector 'x3' has been loaded")
  expect_true(exists("x3"))
  expect_equivalent(x3, y)
})

test_that("One can move data files", {
  assign("x4", rnorm(100), envir = .GlobalEnv)
  prSave("x4")
  prMoveData("x4", "dir4")
  
  expect_false(file.exists("data/x4.rda"))
  expect_true(file.exists("data/dir4/x4.rda"))
})

test_that("One can delete data files", {
  assign("x5", rnorm(100), envir = .GlobalEnv)
  prSave("x5")
  
  prDeleteData("x5")
  
  expect_false(file.exists("data/x5.rda"))
})

test_that("One cannot overwrite a data file", {
  assign("x6", rnorm(100), envir = .GlobalEnv)
  prSave("x6")
  prSave("dir6/x6")
  
  expect_error(prSave("x6"))
  expect_error(prMoveData("x6", "dir6"))
})

test_that("prSave and prLoad work in other directories", {
  setwd("..")
  
  assign("x7", rnorm(100), envir = .GlobalEnv)
  y <- x7
  prSave("x7")
  expect_true(file.exists("project-test/data/x7.rda"))
  rm(x7, envir = .GlobalEnv)
  expect_output(prLoad("x7"), "Numeric vector 'x7' has been loaded")
  expect_true(exists("x7"))
  expect_equivalent(x7, y)
})

test_that("Quotes are optional in prSave and prLoad", {
  assign("x8", rnorm(100), envir = .GlobalEnv)
  y <- x8
  prSave(x8)
  expect_true(file.exists("project-test/data/x8.rda"))
  rm(x8, envir = .GlobalEnv)
  expect_output(prLoad(x8), "Numeric vector 'x8' has been loaded")
  expect_true(exists("x8"))
  expect_equivalent(x8, y)
})
