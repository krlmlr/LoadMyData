#' @details
#' \code{xz}: xz-compressed file via \code{\link{xzfile}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.xz <- function(x, ...)
{
  reader(dataformat(xzfile(x), override_extension = parent_extension()), ...)
}
