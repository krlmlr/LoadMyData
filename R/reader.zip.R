#' @details
#' \code{zip}: bzip2-compressed file via \code{utils::\link[utils]{unzip}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.zip <- function(x, ...)
{
  tmp.path <- tempdir()
  oldwd <- setwd(tmp.path)
  on.exit(setwd(oldwd), add = TRUE)
  files <- unzip(x)
  reader(dataformat(files[[1]]), ...)
}
