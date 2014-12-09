#' @details
#' \code{csv2}: CSV file (semicolon-separated) via \code{\link{read.csv}(sep = ';')}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.csv2 <- function(x, ...)
{
  read_atomic(x, .f = read.csv, header = TRUE, sep = ';')
}
