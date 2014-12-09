#' @details
#' \code{xls}: Excel 2004 files via \code{gdata::\link[gdata]{read.xls}}.
#'   Each sheet will be read, the return value is a list.
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.xls <- function(x, ...)
{
  .require.package('gdata')

  sheets <- gdata::sheetNames(x)
  sheets <- setNames(sheets, clean.variable.name(sheets))

  lapply(
    sheets,
    function(sheet.name)
      try(gdata::read.xls(x, sheet = sheet.name))
  )
}
