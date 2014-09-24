#' Read a gzip-compressed remote file
#'
#' This function will load data from a gzip-compressed file in the format
#' specified by the "parent" extension, i.e. the extension that remains after
#' stripping the \code{.gz} extension.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments passed to the reader invoked.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.gz <- function(x, ...)
{
  reader(dataformat(gzfile(x), override_extension = parent_extension()), ...)
}
