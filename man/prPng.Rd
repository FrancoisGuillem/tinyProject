\name{prPng}
\alias{prPng}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
sortie au format png
}
\description{
Enregistre un graphique au format ".png".
}
\usage{
prPng(name, theme = "black")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
nom du fichier dans lequel enregistrer le graphique (sans l'extension ".png")
}
\item{theme}{Si "black", alors le graphique est affiché en blanc sur fond noir (ne fonctionne que pour
les graphiques de base. Ne fonctionne pas par exemple avec ggplot2 ou latice). Sinon il est affiché
normalement.
}
}
\details{
Le fichier est enregistré dans le dossier "output". Une fois que le graphique est terminé, il faut exécuter
la commande \code{dev.off()} (voir exemple ci-dessous).
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
prPng("test")
plot(rnorm(100))
dev.off()

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
