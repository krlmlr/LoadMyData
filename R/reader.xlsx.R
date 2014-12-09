#' @details
#' \code{xlsx}: Excel 2007 files via \code{xlsx::\link[xlsx]{read.xlsx}}.
#'   Each sheet will be read, the return value is a list.
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.xlsx <- function(x, ...)
{
  .require.package('xlsx')

  wb <- xlsx::loadWorkbook(x)
  sheets <- xlsx::getSheets(wb)
  sheets <- setNames(sheets, clean.variable.name(sheets))

  lapply(
    sheets,
    function(sheet.name)
      try(xlsx::read.xlsx(x, sheetName = sheet.name, header = TRUE))
  )
}
