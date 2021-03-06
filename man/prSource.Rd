% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scripts.R
\name{prSource}
\alias{prSource}
\title{Source a R script}
\usage{
prSource(name, subdir = ".")
}
\arguments{
\item{name}{Name of the script to execute. It can also contain the subfolder where the
script is stored.}

\item{subdir}{subdirectory where the script is located. The 
subdirectory can also be directly specified in the parameter \code{name}.}
}
\description{
Source a R script in the "scripts" folder of the project.
}
\examples{
projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

prScript("helloWorld")

# Edit the script so that it does something cool

prSource("helloWorld")

# Source a file in a subdirectory
prScript("myScript", subdir = "testdir")
prSource("myScript", subdir = "testdir")

# Or equivalently
prSource("testdir/myScript")

}
\seealso{
\code{\link{prLibrary}}, \code{\link{prLoad}}, \code{\link{prSave}}
}
