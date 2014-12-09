#' @details
#' \code{dta}: Stata file via \code{foreign::\link[foreign]{read.dta}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.dta <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.dta)
}
