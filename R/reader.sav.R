#' Read an SPSS file with a .sav file extension.
#'
#' This function will load the specified SPSS file into memory. It will
#' convert the resulting list object into a data frame before inserting the
#' data set into the global environment.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.sav <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.spss, to.data.frame = TRUE)
}
