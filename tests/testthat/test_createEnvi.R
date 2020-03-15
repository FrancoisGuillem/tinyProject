context("Set paths")
library(envimaR)



test_that("automatic folder names", {

  folders = c("data/", "data/tmp/", "data/aerial/org", "data/lidar/org",
              "data/a/test/org", "data/b/test/org")
  envrmt = createEnvi(root_folder = "~/edu", folders = folders,
                      create_folders = FALSE)

  expect_true(grepl("edu/data/b/test/org", envrmt$path_b_test_org))
  expect_true(grepl("edu/data/lidar/org", envrmt$path_lidar_org))

})

