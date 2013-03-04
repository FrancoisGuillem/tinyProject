\name{prLibrary}
\alias{prLibrary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
chargement et installation d'extensions
}
\description{
La fonction charge tous les packages passés en argument et s'ils ne sont pas présents, tente de les
installer.
}
\usage{
prLibrary(package)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{package}{
vecteur contenant les noms des packages à charger.
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
prLibrary(c("doBy", "data.table", "RODBC")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
