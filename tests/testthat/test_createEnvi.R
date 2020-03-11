context("Set paths")
library(envimaR)

test_that("use default values from LUTs", {
  git_repository = "myrep1"
  lut_mode = TRUE
  envrmt = createEnvi(git_repository = git_repository, lut_mode = lut_mode,
                      create_folders = FALSE)

  expect_equal(envrmt$path_data, "C:/Users/tnauss/Documents/plygrnd/data")
  expect_equal(envrmt$path_src, "C:/Users/tnauss/Documents/plygrnd/myrep1/src")
})


test_that("use default values from function and git repository", {
  git_repository = "myrep1"
  envrmt = createEnvi(git_repository = git_repository, create_folders = FALSE)

  expect_true(grepl("C:/Users/tnauss/AppData/Local/Temp/", envrmt$path_myrep1))
  expect_true(grepl("/myrep1", envrmt$path_myrep1))

})


test_that("automatic folder names", {
  git_repository = "myrep1"
  folders = c("data/", "data/tmp/", "data/aerial/org", "data/lidar/org",
              "data/a/test/org", "data/b/test/org")
  envrmt = createEnvi(root_folder = "~/edu", folders = folders,
                      create_folders = FALSE)

  expect_true(grepl("edu/data/b/test/org", envrmt$path_b_test_org))
  expect_true(grepl("edu/data/lidar/org", envrmt$path_lidar_org))

})

