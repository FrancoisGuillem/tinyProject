\name{prSource}
\alias{prSource}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Source un script
}
\description{
Source un script dans le projet courant ou n'importe quel autre projet.
}
\usage{
prSource(name, project = getOption("currentProject"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
nom du script (sans l'extension ".R")
}
  \item{project}{
Dans quel projet chercher le script (par défaut le projet courant).
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
createProject("test")
cat("cat('Hello world')", file = "scripts/helloworld.R")
prSource("helloworld")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
