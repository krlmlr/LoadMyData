#' Read an Excel 2007 file with a .xlsx file extension.
#'
#' This function will load the specified Excel file into memory using the
#' xlsx package. Each sheet of the Excel workbook will be read into a
#' separate variable in the global environment.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.xlsx('example.xlsx', 'data/example.xlsx', 'example')}
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
