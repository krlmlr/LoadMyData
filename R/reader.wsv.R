#' Read a whitespace separated values (.wsv or .txt) file.
#'
#' This function will load a data set stored in the WSV file format into
#' the specified global variable binding.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.wsv <- function(x, ...)
{
  read_atomic(x, .f = read.table, header = TRUE)
}

#' @rdname reader.dataformat.wsv
#' @export
reader.dataformat.txt <- reader.dataformat.wsv
