\name{script}
\alias{script}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
script(name, project = getOption("currentProject"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
%%     ~~Describe \code{name} here~~
}
  \item{project}{
%%     ~~Describe \code{project} here~~
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
function (name, project = getOption("currentProject")) 
{
    if (missing(name)) {
        files <- lsScripts()
        print(files)
        cat("Choix :\n")
        i <- scan(n = 1)
        name <- files[i]
    }
    path <- sprintf("\%s/\%s/scripts/\%s.R", getOption("projectHome"), 
        project, name)
    if (!file.exists(path)) {
        file.create(path)
        cat(sprintf("################################################################################\n# \%s \%s\n################################################################################\n#\n# Objectif:\n#\n# D\303\251marche:\n#\n# R\303\251sultats:\n#\n#\n################################################################################\n", 
            ifelse(name == "main", "PROJECT", "SCRIPT"), ifelse(name == 
                "main", project, name)), file = path)
    }
    file.edit(path)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
