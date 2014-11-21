#' @details
#' \code{rec}: Epi Info file via \code{foreign::\link[foreign]{read.epiinfo}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.epiinfo <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.epiinfo)
}
