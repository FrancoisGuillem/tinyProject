\name{prScript}
\alias{prScript}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
création et ouverture de script.
}
\description{
Cette fonction crée et ouvre un nouveau script. Si le script existe déjà, elle l'ouvre dans l'éditeur de script. 
}
\usage{
script(name, template=c("analysis", "data", "function"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
(facultatif) nom du script
}
  \item{template}{
Quel modèle de script utiliser ?
}
}
\details{
Si l'argument "name" n'est pas renseigné, alors la liste des scripts existants est affichée. L'utilisateur doit alors taper le numéro ou le nom du script qu'il désire ouvrir.
}

\author{
François Guillem <guillem.francois@gmail.com>
}

\seealso{
\code{\link{prSource}}
}
\examples{
prInit()

script("test")
}