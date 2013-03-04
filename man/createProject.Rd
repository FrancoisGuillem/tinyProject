\name{createProject}
\alias{createProject}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
createProject(projectName)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{projectName}{
%%     ~~Describe \code{projectName} here~~
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
function (projectName) 
{
    closeProject()
    path <- paste(prHome(), projectName, sep = "/")
    if (projectName \%in\% dir()) {
        stop("Project already exists !")
    }
    dir.create(path)
    setwd(path)
    options(currentProject = projectName)
    dir.create("data")
    dir.create("output")
    dir.create("scripts")
    file.create(".RData")
    file.create(sprintf("\%s.Rhistory", projectName))
    script("data")
    script("main")
    script("start")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
