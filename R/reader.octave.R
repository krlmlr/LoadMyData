#' @details
#' \code{m}: Octave format via \code{foreign::\link[foreign]{read.octave}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.octave <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.octave)
}
