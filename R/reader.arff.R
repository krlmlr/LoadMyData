#' Read the Weka file format.
#'
#' This function will load a data set stored in the Weka file format into
#' the specified global variable binding.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.arff('example.arff', 'data/example.arff', 'example')}
reader.dataformat.arff <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.arff)
}
