#' Read an XBASE file with a .dbf file extension.
#'
#' This function will load all of the data sets stored in the specified
#' XBASE file into the global environment.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.dbf('example.dbf', 'data/example.dbf', 'example')}
reader.dataformat.dbf <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.dbf)
}
