\name{prInit}
\alias{prInit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
initialisation d'un projet
}
\description{
\code{prInit} doit être utilisée au sein d'un projet R-studio. La fonction crée des
dossiers et des sripts qui vous aiderons à bien organiser votre travail.
}
\usage{
prInit()
}
%- maybe also 'usage' for other objects documented here.

\details{
La fonction crée dans le répertoire du projet trois dossiers :
\itemize{
\item scripts : Dossier qui contient tous les scripts du projet
\item data : Dossier où sont stockées les données du projet
\item output : Dossier où sont stockés les résultats
}

Bien sûr, vous pouvez créer d'autres dossiers à votre contenance (ex: latex, 
html, etc.).

Trois scripts sont créés d'office : 

\itemize{
\item main : C'est le script principal. Si votre projet est petit, vous pouvez
écrire tout votre code dedans. Sinon, vous pouvez y mettre des commentaires
décrivant la structure de votre projet et des références aux autres scripts
avec la fonction \code{\link{prScript}}.
\item data : Script permettant de créer les données de votre projet.
\item start : Script qui est éxécuté à chaque fois que le projet est ouvert.
Vous pouvez entre autres charger des bibliothèques avec \code{\link{prLibrary}}
ou exécuter des scripts avec \code{\link{prSource}}.
}
}

\author{
François Guillem <guillem.francois@gmail.com>
}

\seealso{
\code{\link{prLibrary}}, \code{\link{prSource}}, \code{\link{prSave}}, 
\code{\link{prLoad}}, \code{\link{prScript}}
}

\examples{
# A utiliser dans un projet R-studio
# prInit()
}


