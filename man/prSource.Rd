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
prSource(name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
nom du script (sans l'extension ".R")
}
}

\author{
François Guillem <guillem.francois@gmail.com>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{prLibrary}}, \code{\link{prLoad}}, \code{\link{prSave}}
}
\examples{
prInit()

cat("cat('Hello world')", file = "scripts/helloworld.R")
prSource("helloworld")
}