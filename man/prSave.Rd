\name{prSave}
\alias{prSave}
\alias{prLoad}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
sauvegarde et chargement de données.
}
\description{
Ces fonctions enregistrent et chargent des données dans le dossier "data" du projet. Chaque objet
est enregistré dans un fichier portant le même nom et avec l'extension ".rda".
}
\usage{
prSave(name, replace = FALSE, desc = "No description", subdir)
prLoad(name, trace = TRUE, description = TRUE, creationTime = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
Nom de l'objet à enregistrer (entre guillemets)
}
  \item{replace}{
Si le fichier existe déjà, faut-il l'écraser ? Permet d'éviter des drames !
}
  \item{desc}{Description de l'objet sauvegardé}
  \item{subdir}{
(facultatif). Dans quel sous-répertoire de "data" faut-il sauvegarder l'objet ?
}
  \item{trace}{Faut-il afficher des informations sur l'objet chargé}
  \item{description}{Faut-il afficher la description de l'objet chargé}
  \item{creationTime}{Faut-il afficher la date de création de l'objet chargé}
}
\details{
Les objets sont enregistrés au format ".rda" dans le dossier data dans un
fichier portant le même nom que l'objet.
}

\author{
François Guillem <guillem.francois@gmail.com>
}

\seealso{
\code{\link{prLibrary}}, \code{\link{prSource}}
}
\examples{
prInit()

test <- rnorm(100)
prSave("test")
prSave("test", TRUE, "Juste un test !")
rm(test) # on supprime test

prLoad("test")
test # il est réapparu !
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
