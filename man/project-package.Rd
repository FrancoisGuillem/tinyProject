\name{project-package}
\alias{project-package}
\alias{project}
\docType{package}
\title{
Organise a R data analysis project
}
\description{
When working with R on a data analysis project, data files, scripts and output files multiply very quickly.

The purpose of this package is to help the user to keep things organised and improve readibility, maintainability an reusability of its R projects. Moreover it improves the productivity by saving a few seconds very often: it reduces the time spent searching, loading and saving data and scripts.

This package is designed to be used with the Rstudio projects system.

}
\details{
\tabular{ll}{
Package: \tab project\cr
Type: \tab Package\cr
Version: \tab 0.5\cr
Date: \tab 2016-05-19\cr
License: \tab GPL (>= 2)\cr
}

A data analysis project uses one or several data sources and a bunch of scripts to answer questions about some subject and to generate material that will help the diffusion of the results of the project. Ths quality of the answers is not the only critorion of quality of a project: it should also be easy to read and the results should be easy to reproduce. 

The purpose of this package is to improve these two aspects by encouraging the user to adopt some simple conventions: every project has the same structure, the scripts always do the same type of operations and are heavily commented, the data is always in the same folder and is also documented, etc.

\subsection{Project setup}{
To begin with this package, one has to first create an empty project in Rstudio. Then one can use function \code{\link{prInit}} to setup the project and create a file tree. More precisely \code{\link{prInit}} generates three directories: \code{data} for storing data files, \code{scripts} for storing R scripts and \code{output} for storing output files.

Additionally, three scripts are created and opened in the script editor: \code{data.R} for the import and processing of data, \code{main} for the analysis of the data and \code{start} for all instructions that have to be exetuted everytime the project is opened (load libraries, define constants and functions, etc.).

When the user opens the project in Rstudio, the script \code{start} is automatically executed. By convention, all scripts starting with the prefix "tools" are also executed. It can be useful to automatically load important specific functions, constants or data.
}

\subsection{Script management}{
The user can open and/or create scripts with the function \code{\link{prScript}}. He just has to give to the function the name of the script (without the extention ".R") and eventually a subdirectory. The fucntion searches in the folder "scripts" the corresponding file. If it does not exists, it is created. In all cases it is opened in the script editor.

The scripts created by \code{\link{prScript}} contains some comments that encourages the user to explain what the script does and eventually what were the results.

although it is not mandatory, the user should use some conventions in the naming of its scripts: a script that process data should start with the prefix "data" while a script that analyses data should start with prefix "analysis". Other scripts generally contain helper functions and their name should start with "tools". They will be sourced when the project is opened.

When possible, data operations and analysis operations should be put in different scripts. If the data operations are long, then the data script should save the final data objects and the analysis script should load the saved data.

Scripts can be sourced with function \code{\link{prSource}}. It is a wrapper to the function \code{\link{source}} but with the same interface as \code{\link{prScript}}.
}

\subsection{Data management}{
Every R object can be saved with \code{\link{prSave}}. The function just needs the name of the object (quoted) and it will save it in the right place so one has not to remember the location where objects are saved. \code{\link{prSave}} can also attach to an object a description that will be displayed when the object is loaded. 

To load data, simply use \code{\link{prLoad}}.
}
}

\author{
François Guillem

Maintainer: François Guillem <guillem.francois@gmail.com>
}
