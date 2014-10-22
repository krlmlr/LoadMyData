#' Read a tab separated values (.tsv or .tab) file.
#'
#' This function will load a data set stored in the TSV file format into
#' the specified global variable binding.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.tsv <- function(x, ...)
{
  read_atomic(x, .f = read.csv, header = TRUE, sep = '\t')
}

#' @rdname reader.dataformat.tsv
#' @export
reader.dataformat.tab <- reader.dataformat.tsv
