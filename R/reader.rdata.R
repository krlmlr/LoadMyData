#' Read an RData file with a .rdata or .rda file extension.
#'
#' This function will load the specified RData file into memory using the
#' \code{\link{load}} function. This may generate many data sets
#' simultaneously.
#'
#' @param data.file The name of the data file to be read.
#' @param x The path to the data set to be loaded.
#' @param variable.name The name to be assigned to in the global environment.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.RData <- function(x, data.file, variable.name, ...)
{
  load(x, envir = .TargetEnv)
}

#' @rdname reader.dataformat.RData
#' @export
reader.dataformat.rda <- reader.dataformat.RData
