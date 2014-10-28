#' Read an Excel 2004 file with a .xls file extension.
#'
#' This function will load the specified Excel file into memory using the
#' gdata package. Each sheet of the Excel workbook will be read into a
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
#' \dontrun{reader.xls('example.xls', 'data/example.xls', 'example')}
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
