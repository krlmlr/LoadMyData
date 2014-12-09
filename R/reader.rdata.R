#' @details
#' \code{rda}, \code{Rdata}: An RData file.  All datasets are loaded.
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.RData <- function(x, ...)
{
  env <- new.env()
  load(x, envir = env)
  as.list(env)
}

#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.rda <- reader.dataformat.RData
