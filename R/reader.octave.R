#' Read an Octave file with a .m file extension.
#'
#' This function will load the specified Octave file into memory.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.octave('example.m', 'data/example.m', 'example')}
reader.dataformat.octave <- function(x, ...)
{
  .require.package('foreign')

  list(foreign::read.octave(x))
}
