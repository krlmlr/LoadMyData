#' @details
#' \code{syd}, \code{sys}: Systat file via \code{foreign::\link[foreign]{read.systat}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.systat <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.systat)
}
