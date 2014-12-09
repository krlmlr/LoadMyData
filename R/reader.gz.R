#' @details
#' \code{gz}: gzip-compressed file via \code{\link{gzfile}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.gz <- function(x, ...)
{
  tryCatch(
    reader(dataformat(con <- gzfile(x, "rb"), override_extension = parent_extension()), ...),
    finally = close(con)
  )
}
