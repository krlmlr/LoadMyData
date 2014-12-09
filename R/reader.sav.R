#' @details
#' \code{sav}: SPSS data files via \code{foreign::\link[foreign]{read.spss}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.sav <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.spss, to.data.frame = TRUE, ...)
}
