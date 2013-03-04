prFormat <- function(x, collapse = ", ") {
  e <- parent.frame()
  ._x <- x
  ._m <- gregexpr("#\\{(.*?)\\}", ._x)
  ._var <- lapply(regmatches(._x,._m), function(._x) {
    gsub("(#\\{|})", "", ._x)
  })

  regmatches(._x, ._m) <- lapply(._var, function(._x) {
    sapply(._x, function(._y) {
      ._z <- get(._y, envir=e)
      if (!is.atomic(._z)) stop("La variable '",._y, "' n'est pas un vecteur",
                                call. = FALSE)
      paste(._z, collapse = collapse)
    })
    })
  ._x
}