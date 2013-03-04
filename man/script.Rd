\name{script}
\alias{script}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
création et ouverture de script.
}
\description{
Cette fonction crée et ouvre un nouveau script. Si le script existe déjà, elle l'ouvre dans l'éditeur
de script. 
}
\usage{
script(name, project = getOption("currentProject"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
(facultatif) nom du script
}
  \item{project}{
Dans quel projet chercher le script ? (par défaut, projet courant)
}
}
\details{
Si l'argument "name" n'est pas renseigné, alors la liste des scripts existants est affichée. L'utilisateur
doit alors taper le numéro du script qu'il désire ouvrir.
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
script("test")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
