#' @details
#' \code{dbf}: CSV file (comma-separated) via \code{\link{read.csv}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.csv <- function(x, ...)
{
  read_atomic(x, .f = read.csv, header = TRUE, sep = ',')
}
