[![Travis-CI Build Status](https://travis-ci.org/FrancoisGuillem/tinyProject.svg?branch=master)](https://travis-ci.org/FrancoisGuillem/tinyProject)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/FrancoisGuillem/tinyProject?branch=master&svg=true)](https://ci.appveyor.com/project/FrancoisGuillem/tinyProject)
[![Coverage Status](https://img.shields.io/codecov/c/github/FrancoisGuillem/tinyProject/master.svg)](https://codecov.io/github/FrancoisGuillem/tinyProject?branch=master)

# `tinyProject`: A lightweight and customizable data analysis framework for R users

This package proposes a lightweight and flexible framework for your statistical analyses and helps you spend less time on file management and more time on data analysis!

## What is a framework? What is it useful for?

A framework is basically a way of organizing files and code, plus a bunch of utility functions that automate common tasks that take time without adding value to your work.

Using a framework has several advantages:

### Save time 
Don't lose time by always creating always the same folders and scripts, configuring your project, searching and installing project dependencies, searching which data in stored in which file...
### Encourage good practices
Everything is in the title!
### Facilitate reproducibility
With a framework, you know where things are and which scripts to look at first. This is crucial if you have to share your projects but it is also useful if you need to come back to an old project.

## What does that mean "lightweight and customizable"?
Some frameworks may actually be quite complex to use and requiring some time consuming training to them properly. As you will see below, `tinyProject` is very simple and only provides a few functions.

It is ideal from small and medium sized projects and it can be used by anybody, even users without training in computer programming (which is the case of most R users). 

Yet, `tinyProject` gives some way to customize your projects. You can even use it to create your own project framework in your own package in order to better fit your needs.

## Installation
The package is available on CRAN.
```r
install.packages("tinyProject")
```
You can also install it from Github with package devtools:
```r
install.packages(c("brew", "devtools"))
devtools::install_github("FrancoisGuillem/tinyProject")
```

## Create a new project
To initialize a project, run the following command (ideally in an empty Rstudio project):

```r
library(tinyProject)
prInit()
```

By default, it creates three folders: `data` , `scripts` for `output` for respectively data, scripts and outputs storage. It also open three scripts filled with some instructions: `data.R` for data munging, `main.R` for data analysis and `start.R` for project configuration like loading libraries, setting constant variables... This last script is automatically run when you open your project.

`tinyProject` provides some functions that replace the corresponding base R functions. They are all prefixed by `pr` (like pr like `project`). Here are a few ones:

### Dependency management: prLibrary()
use `prLibrary()` to load libraries. If they are missing, the function will install it for you.

### Caching data: prSave() and prLoad()
Saving and loading data is super simple. you'll quickly become addict to functions `prSave()` and `prLoad()`!

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
 
### Creating and opening scripts: prScript()
This function has two purposes:
- Creating a new script based on a template
- Opening an existing script. This is useful to create some kind of hyperlinks between scripts.

Just give it a script name (without extension). If the script does not exist, it will create it, else it will open it in your editor. The function also takes care of creating subfolders if needed:

```r
prScript("my_subdirectory/my_script")
```

By default, scripts that are stored in a subfolder called 'tools' are automatically sourced when you open the project (with Rstudio or with `prStart()`). This is useful to automatically load functions at startup.

## Using tinyProject in Rmarkdown documents
When you have achieved your analysis, you may want to create a report with Rmarkdown. To be able to access your data and functions from a Rmarkdown document just include the following lines:

```r
library(tinyProject)
prStart("relative_path_of_project_root")
```

You can then use all functions and packages that have been automatically loaded and you can access the saved data with `prLoad()`.

## Some advices
* In small projects, most of the code should be in scripts `data.R` and `main.R`. In larger projects you should instead use these two scripts to explain your approach with comments and put links to the scripts that contain the effective code with function `prScript()`.

* Analysis scripts have to be clear: do not put in them long and technical code that could hide the general opproach inside them. Instead put it in functions with explicit names and store them in the subfolder "tools".

* Write a lot of comments! Explain with words your general approach, describe how you got your raw data. If you have done some manual operation outside of R, document it. R projects need more comments than other projects because statistical complexity is added to the technical complexity of a computer program. In my experience, a good statistical project should contain about 30% of comments: on average there should be one line of comment for two lines of R code.

* `prSave()` and `prLoad()` can help you save a lot of time, use them a lot! Each time you perform a time consuming operation, you should save the result even if it is not final data you require. when you'll do mistake you will only have to reload your intermediary result with "prLoad" instead of executing the whole script again.
