#' @details
#' \code{mtp3}: Minitab Portable Worksheet via \code{foreign::\link[foreign]{read.mtp}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.mtp <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.mtp)
}
