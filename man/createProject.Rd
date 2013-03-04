\name{createProject}
\alias{createProject}
\alias{project}
\alias{closeProject}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
création, ouverture et fermeture d'un projet
}
\description{
\code{createProject} crée un dossier portant le nom du projet et crée à l'intérieur trois sous-dossiers:
"data", "scripts" et "output". De plus la fonction crée et ouvre trois scripts: "data", "start" et "main".

La fonction \code{project} ouvre un projet existant, exécute le script "start" ainsi que tous les
scripts dont le nom commence par "tools". Enfin, elle ouvre dans l'éditeur le script "main".

Enfin la fonction \code{closeProject} ferme le projet courant et enregistre l'historique et 
éventuellement l'espace de travail. Cette fonction est appelée automatiquement lors d'un changement
de projet ou lors de la fermeture de R.
}
\usage{
createProject(projectName)
project(projectName, load = FALSE)
closeProject(save = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{projectName}{
nom du projet
}
\item{load}{
Faut-il charger l'espace de travail ? (pertinent que s'il a été sauvegardé durant la session précédente).
}
  \item{save}{
Faut-il enregistrer l'espace de travail ? (défaut: FALSE)
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
project("test")
closeProject("test")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
