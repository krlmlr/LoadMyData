#' Read a semicolon separated values (.csv2) file.
#'
#' This function will load a data set stored in the CSV2 file format into
#' the specified global variable binding.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.csv2('example.csv2', 'data/example.csv2', 'example')}
reader.dataformat.csv2 <- function(x, ...)
{
  read_atomic(x, .f = read.csv, header = TRUE, sep = ';')
}
