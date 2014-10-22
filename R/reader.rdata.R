#' Read an RData file with a .rdata or .rda file extension.
#'
#' This function will load the specified RData file into memory using the
#' \code{\link{load}} function. This may generate many data sets
#' simultaneously.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.RData <- function(x, ...)
{
  env <- new.env()
  load(x, envir = env)
  as.list(env)
}

#' @rdname reader.dataformat.RData
#' @export
reader.dataformat.rda <- reader.dataformat.RData
