#' @details
#' \code{txt}, \code{wsv}: WSV file (whitespace-separated) via \code{\link{read.table}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.wsv <- function(x, ...)
{
  read_atomic(x, .f = read.table, header = TRUE)
}

#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.txt <- reader.dataformat.wsv
