#' Read a PPM file with a .ppm file extension.
#'
#' This function will load the specified PPM file into memory using the
#' pixamp package. This is useful for working with image files as a data
#' set.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.ppm('example.ppm', 'data/example.ppm', 'example')}
reader.dataformat.ppm <- function(x, ...)
{
  .require.package('pixmap')

  list(pixmap::read.pnm(x))
}
