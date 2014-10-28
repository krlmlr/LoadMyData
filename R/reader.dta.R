#' Read a Stata file with a .dta file extension.
#'
#' This function will load the specified Stata file into memory.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.stata('example.stata', 'data/example.stata', 'example')}
reader.dataformat.dta <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.dta)
}
