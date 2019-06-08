context("commandArgs")

with_mock(
  `R.utils::cmdArgs` = function(...) {
    list("unnamed1", "unnamed2", Name1 = "value1", Name2 = "value2")
  },
  {
    test_that("readCommandArgs() correctly sets option prArgs", {
      readCommandArgs()
      
      expect_true(!is.null(getOption("prArgs")))
      
      expected <- list(
        named = list(Name1 = "value1", Name2 = "value2"),
        unnamed = list("unnamed1", "unnamed2")
      )
      expect_equal(getOption("prArgs"), expected)
    })
    
    test_that("getCommandArg() can get named argument", {
      expect_equal(getCommandArg("Name1"), "value1")
      expect_equal(getCommandArg("Name1"), "value1")
      expect_equal(getCommandArg("Name2"), "value2")
    })
    
    test_that("getCommandArg() can get unnamed argument", {
      expect_equal(getCommandArg("unnamed1"), "unnamed1")
      expect_equal(getCommandArg("unnamed1"), "unnamed1")
      expect_equal(getCommandArg("unnamed2"), "unnamed2")
      expect_equal(getCommandArg("unnamed2"), "unnamed2")
      expect_error(getCommandArg("unnamed3"), "Missing value")
      expect_equal(getCommandArg("Name1"), "value1")
      expect_equal(getCommandArg("unnamed1"), "unnamed1")
    })
  }
)
