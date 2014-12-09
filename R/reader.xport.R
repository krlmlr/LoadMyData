#' @details
#' \code{xport}, \code{xpt}: SAS Xport file via \code{foreign::\link[foreign]{read.xport}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.xport <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.xport)
}

#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.xpt <- reader.dataformat.xport
