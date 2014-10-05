#' Read an R source file with a .R file extension.
#'
#' This function will call source on the specified R file, executing the
#' code inside of it as a way of generating data sets dynamically, as in
#' many Monte Carlo applications.
#'
#' @param data.file The name of the data file to be read.
#' @param x The path to the data set to be loaded.
#' @param variable.name The name to be assigned to in the global environment.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.r <- function(x, data.file, variable.name, ...)
{
  source(x)
}

#' @rdname reader.dataformat.r
#' @export
reader.dataformat.R <- reader.dataformat.r