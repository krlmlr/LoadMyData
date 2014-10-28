#' Read an Epi Info file with a .rec file extension.
#'
#' This function will load all of the data sets stored in the specified
#' Epi Info file into the global environment.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.epiinfo('example.rec', 'data/example.rec', 'example')}
reader.dataformat.epiinfo <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.epiinfo)
}
