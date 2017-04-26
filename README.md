[![Travis-CI Build Status](https://travis-ci.org/FrancoisGuillem/tinyProject.svg?branch=master)](https://travis-ci.org/FrancoisGuillem/tinyProject)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/FrancoisGuillem/tinyProject?branch=master&svg=true)](https://ci.appveyor.com/project/FrancoisGuillem/tinyProject)
[![Coverage Status](https://img.shields.io/codecov/c/github/FrancoisGuillem/tinyProject/master.svg)](https://codecov.io/github/FrancoisGuillem/tinyProject?branch=master)

# R package "project"

When working with R on a data analysis project, data files, scripts and output files multiply very quickly and it becomes hard to find your scripts and what they precisely do or which data is stored in which file.

The `project` package aims to improve a little bit your productivity, the readibility and maintanibility of your projects by helping you keep your files clearly organised and encouraging you to use some basic conventions and to comment everything. This way, you can focus more on your data and less on trivial stuff like "where should I put this file ?"

## Installation

```r
install.packages(c("brew", "devtools"))
devtools::install_github("cuche27/project")
```

## Set-up

First create an empty Rstudio project, then use the following commands:

```r
library(project)
prInit()
```

This will create a basic file tree in your project directory:

- `data`: directory where to put source data files and where the R objects you save will be stored
- `scripts`: directory where scripts will be stored
- `output`: directory where you ca store the results of your analyses

Moreover, three scripts are created and opened in the script editor:

- `data.R`: should contain all instructions to import data from source files or external sources to the R session. In a large project, this file should contain only links to the scripts that actually do the job with small comments explaining what each script does.
- `main.R`: should contain the analysis code. For a small project it can contain all the code, but for larger projects, it should contain references to the scripts that actually do the analysis with comments explaining the general methodology and what question do each script answer.
- `start.R`: this is a special script that is executed every time the project is opened. This script should load all the necesary libraries and do all technical stuff that is not directly data manipulation or analysis.

## Creating scripts
To create scripts, use the function `prScript`. Just give it the name of the script without extension and it will create it (unless it already exists) and will open it in the script editor. The created script contains a few comment that encourage you to explain what your script does.

To help understanding what your script do, use the following conventions:

- Scripts that imports and process data should start with the prefix "data"
- Analysis scripts should start with prefix "analysis"
- To keep the previous scripts easy to read, long function definitions should be put in scripts starting with the prefix "tools". By convention, these scripts will be executed each time the project is opened so you are sure these functions will be available in all your data and alaysis scripts.

## Saving and loading data
You can save and load R objects wit h functions `prSave` and `prLoad`. They just need the quoted name of the object you want to save or load. `prSave` also gives you the possibility to attach a small description to your object with the following syntax:

```r
x <- rnorm(100)
prSave("x", desc = "Random variable with gaussian distribution")
```

`prLoad` displays basic information about the loaded object and eventually displays the description attached to the object:
```r
prLoad("x")

### Numeric vector 'x' has been loaded (saved on 2016-05-23 00:25:17):
###    Random variable with gaussian distribution 
```

In some projects, you may want to save different objects with the same name. In that case you can save them and load them in subdirectories: 

```r
prSave("mydir/x")
prLoad("mydir/x")
```

If the subdirectory is missing the function will take care of creating it before saving an object.
