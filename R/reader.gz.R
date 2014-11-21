#' @details
#' \code{gz}: gzip-compressed file via \code{\link{gzfile}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.gz <- function(x, ...)
{
  reader(dataformat(gzfile(x), override_extension = parent_extension()), ...)
}
