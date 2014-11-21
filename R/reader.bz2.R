#' @description
#' If the data format is a compressed file or archive, it will be
#' extracted and the extracted file(s) will be read.
#'
#' @details
#' \code{bz2}: bzip2-compressed file via \code{\link{bzfile}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.bz2 <- function(x, ...)
{
  reader(dataformat(bzfile(x), override_extension = parent_extension()), ...)
}
