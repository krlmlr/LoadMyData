#' Read a zip-compressed remote file
#'
#' This function will load data from a zip-compressed file.  The file names must
#' be specified.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments passed to the reader invoked.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.zip <- function(x, data.file, variable.name, ...)
{
  tmp.dir <- tempdir()
  tmp.path <- file.path(tmp.dir, data.file)
  file.copy(x, tmp.path)
  unzip(x, exdir = tmp.dir)
  x <- file.path(tmp.dir, sub('\\.zip$', '', data.file))

  reader(dataformat(x), variable.name = variable.name, ...)
}
