#' Read a Minitab Portable Worksheet with an .mtp3 file extension.
#'
#' This function will load the specified Minitab Portable Worksheet into
#' memory.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.mtp('example.mtp', 'data/example.mtp', 'example')}
reader.dataformat.mtp <- function(x, ...)
{
  .require.package('foreign')

  list(foreign::read.mtp(x))
}
