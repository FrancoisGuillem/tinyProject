\name{project}
\alias{project}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
project(projectName, load = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{projectName}{
%%     ~~Describe \code{projectName} here~~
}
  \item{load}{
%%     ~~Describe \code{load} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (projectName, load = FALSE) 
{
    closeProject()
    options(currentProject = projectName)
    setwd(paste(prHome(), projectName, sep = "/"))
    if (load) {
        load(".RData")
    }
    source("scripts/start.R")
    tools <- lsScripts()
    tools <- tools[grep("tools", tools)]
    if (length(tools) > 0) {
        sapply(sprintf("scripts/\%s.R", tools), source)
    }
    if (interactive()) {
        file.edit("scripts/main.R")
        loadhistory(sprintf("\%s.Rhistory", projectName))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
