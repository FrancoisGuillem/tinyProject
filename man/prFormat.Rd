\name{prFormat}
\alias{prFormat}

\title{
Génération de texte dynamique
}
\description{
\code{prFormat} génère du texte dynamiquement comme \code{\link{sprintf}},
mais avec cette fonction, au lieu d'utiliser des "\%s", on écrit directement le
nom de la variable dans le texte de la façon suivante : "#\{var\}" (voir exemple).
}
\usage{
prFormat(._x, collapse = ", ")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{._x}{
  un vecteur de type "character"
}
\item{collapse}{
character passé à paste. Si une variable a une longueur supérieure à un, alors les différents éléments de la variable seront séparés par cette chaine de caractère dans le texte final.
}

}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
un vecteur de type "character" de la même longeur que "._x".
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Francois Guillem
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x <- 1:4
y <- "abcd"
prFormat(c("x = #{x}", 
           "y = #{y}", 
           "x = #{x} and y = #{y}", 
           "z = 1"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
