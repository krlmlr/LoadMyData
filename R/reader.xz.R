#' @details
#' \code{xz}: xz-compressed file via \code{\link{xzfile}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.xz <- function(x, ...)
{
  tryCatch(
    reader(dataformat(con <- xzfile(x, "rb"), override_extension = parent_extension()), ...),
    finally = close(con)
  )
}
