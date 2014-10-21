#' Read a zip-compressed remote file
#'
#' This function will load data from a zip-compressed file.  Only the first file
#' will be extracted.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments passed to the reader invoked.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.zip <- function(x, ...)
{
  tmp.path <- tempdir()
  oldwd <- setwd(tmp.path)
  on.exit(setwd(oldwd), add = TRUE)
  files <- unzip(x)
  reader(dataformat(files[[1]]), ...)
}
