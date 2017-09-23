[![Travis-CI Build Status](https://travis-ci.org/FrancoisGuillem/tinyProject.svg?branch=master)](https://travis-ci.org/FrancoisGuillem/tinyProject)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/FrancoisGuillem/tinyProject?branch=master&svg=true)](https://ci.appveyor.com/project/FrancoisGuillem/tinyProject)
[![Coverage Status](https://img.shields.io/codecov/c/github/FrancoisGuillem/tinyProject/master.svg)](https://codecov.io/github/FrancoisGuillem/tinyProject?branch=master)

# `tinyProject`: A lightweight data analysis framework

This package proposes proposes a lightweight and flexible framework for your statistical analyses and helps you spend less time on file management and more time on data analysis! Easily access your data and scripts even after an accidental `setwd()` or a reboot.

## Why have I developed this package?
When working with R on a data analysis project, data files, scripts and output files multiply very quickly and it quickly becomes hard and time consuming to find your scripts and what they precisely do or which data is stored in which file.

As a freelance data analyst, I'm especially concerned by this problem. I have worked on many projects for many companies. Some projects only last a few days and sometimes after many months a client wants me to update or deepen some old analysis.

This package helps me be more efficient in my job. I spend less time in setting up things or trying to understand what I did months ago.

## Installation
For now, the package is only available on Github:
```r
install.packages(c("brew", "devtools"))
devtools::install_github("FrancoisGuillem/tinyProject")
```

## Create a new project
To use the framework, run the following command (ideally in an empty Rstudio project)

```r
library(tinyProject)
prInit()
```

By default, it creates three folders: `data` , `scripts` for `output` for respectively data, scripts and outputs storage. It also open three scripts filled with some instructions: `data.R` for data munging, `main.R` for data analysis and `start.R`. 

This last script is executed each time the project is open either with Rstudio or with `prStart()`. This is useful to load packages or to define constants.

## Accessing data
Accessing data is super simple. you'll quickly become addict to functions `prSave()` and `prLoad()`!

```r
x <- rnorm(100)
# Save object on hard drive
prSave(x)

# Load object from hard drive
prLoad(x)
```

If you save important and stable objects, attach to them a description:
```r
prSave(x, desc="Hundred random draws of a normal distribution")

prLoad(x)
## Numeric vector 'x' has been loaded (saved on 2017-04-26 22:07:25):
##    Hundred random draws of a normal distribution 
```
 
## Creating and opening scripts
Creating and opening scripts is also very easy. Just use function `prScript()`. Give it a script name (without extension) and it opens the desired file in the script editor. If the file does not exists, it creates it before opening it.

You can easily organize your scripts by putting them in subfolders. If the subfolders do not exist they are automatically created:

```r
prScript("my_subdirectory/my_script")
```

By default, scripts that are stored in a subfolder called 'tools' are automatically sourced when you open the project (with Rstudio or with `prStart()`). This is useful to automatically load functions at startup.

## Using tinyProject in Rmarkdown documents
When your analysis is terminated, you may want to create a report with Rmarkdown. To be able to access your data and functions from a Rmarkdown document just include the following lines:

```r
library(tinyProject)
prStart("relative_path_of_project_root")
```

You can then use all functions and packages that have been automatically loaded and you can access the saved data with `prLoad()`.

## Some advices
* In small projects, most of the code should be in script `data.R` and `main.R`. In larger projects you should instead use these two scripts to explain your approach with comments and put links to the scripts that contain the effective code with function `prScript()`.

* Analysis scripts have to be clear: do not put in them long and technical code that could hide the general opproach inside them. Instead put it in functions with explicit names and store them in the subfolder "tools".

* Write a lot of comments! Explain with words your general approach, describe how you got your raw data. If you have done some manual operation outside of R, document it. R projects need more comments than other projects because statistical complexity is added to the technical complexity of a computer program. In my experience, a good statistical project should contain about 30% of comments: on average there should be one line of comment for two lines of R code.

* `prSave()` and `prLoad()` can help you save a lot of time, use them a lot! Each time you perform a time consuming operation, you should save the result even if it is not final data you require. when you'll do mistake you will only have to reload your intermediary result with "prLoad" instead of executing the whole script again.
