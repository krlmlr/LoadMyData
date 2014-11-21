#' @details
#' \code{dbf}: xBase file via \code{foreign::\link[foreign]{read.dbf}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.dbf <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.dbf)
}
