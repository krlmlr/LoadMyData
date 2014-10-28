#' @details
#' \code{ppm}: PPM file format via \code{pixmap::\link[pixmap]{read.pnm}}.
#'   Useful for working with image files as a data set.
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.ppm <- function(x, ...)
{
  .require.package('pixmap')
  read_atomic(x, .f = pixmap::read.pnm)
}
