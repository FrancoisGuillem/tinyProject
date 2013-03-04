\name{prFormat}
\alias{prFormat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
prFormat(._x, collapse = ", ")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{._x}{
%%     ~~Describe \code{._x} here~~
}
  \item{collapse}{
%%     ~~Describe \code{collapse} here~~
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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (._x, collapse = ", ") 
{
    e <- parent.frame()
    ._m <- gregexpr("#\\{(.*?)\\}", ._x)
    ._var <- lapply(regmatches(._x, ._m), function(._x) {
        gsub("(#\\{|})", "", ._x)
    })
    regmatches(._x, ._m) <- lapply(._var, function(._x) {
        sapply(._x, function(._y) {
            ._z <- get(._y, envir = e)
            if (!is.atomic(._z)) 
                stop("La variable '", ._y, "' n'est pas un vecteur", 
                  call. = FALSE)
            paste(._z, collapse = collapse)
        })
    })
    ._x
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
