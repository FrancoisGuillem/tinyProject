\name{prLibrary}
\alias{prLibrary}

\title{
chargement et installation d'extensions
}
\description{
La fonction charge tous les packages passés en argument et s'ils ne sont pas présents, tente de les installer.
}
\usage{
prLibrary(...)
}

\arguments{
  \item{...}{
noms des packages à charger, entre guillemets et séparés par des virgules.
}
}

\author{
François Guillem <guillem.francois@gmail.com>
}

\seealso{
\code{\link{prSource}}
}
\examples{
prLibrary(c("doBy", "data.table"))
}