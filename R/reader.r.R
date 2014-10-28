#' Read an R source file with a .R file extension.
#'
#' This function will call source on the specified R file, executing the
#' code inside of it as a way of generating data sets dynamically, as in
#' many Monte Carlo applications.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.r <- function(x, ...)
{
  env <- new.env()
  source(x, local = env)
  as.list(env)
}

#' @rdname reader.dataformat.r
#' @export
reader.dataformat.R <- reader.dataformat.r
