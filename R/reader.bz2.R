#' Read a bzip2-compressed remote file
#'
#' This function will load data from a bzip2-compressed file in the format
#' specified by the "parent" extension, i.e. the extension that remains after
#' stripping the \code{.bz2} extension.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments passed to the reader invoked.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.bz2 <- function(x, ...)
{
  reader(dataformat(bzfile(x), override_extension = parent_extension()), ...)
}
