#' @details
#' \code{tab}, \code{tsv}: TSV file (tab-separated) via \code{\link{read.csv}(sep = '\\t')}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.tsv <- function(x, ...)
{
  read_atomic(x, .f = read.csv, header = TRUE, sep = '\t')
}

#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.tab <- reader.dataformat.tsv
