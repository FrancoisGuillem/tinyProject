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
prSave(name, replace = FALSE, subdir)
prLoad(name, project = getOption("currentProject"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
Nom de l'objet à enregistrer (entre guillemets)
}
  \item{replace}{
Si le fichier existe déjà, faut-il l'écraser. Permet d'éviter des drames.
}
  \item{subdir}{
(facultatif). Dans quel souss-répertoire de "data" faut-il sauvegarder l'objet ?
}
  \item{project}{
Dans quel projet chercher le fichier ? Par défaut, il s'agit du projet courant.  
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
test <- rnorm(100)
prSave("test")
rm(test) # on supprime test

prLoad("test")
test # il est réapparu !
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
