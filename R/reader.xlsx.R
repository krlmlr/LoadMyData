#' Read an Excel 2007 file with a .xlsx file extension.
#'
#' This function will load the specified Excel file into memory using the
#' xlsx package. Each sheet of the Excel workbook will be read into a
#' separate variable in the global environment.
#'
#' @param data.file The name of the data file to be read.
#' @param x The path to the data set to be loaded.
#' @param workbook.name The name to be assigned to in the global environment.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.xlsx('example.xlsx', 'data/example.xlsx', 'example')}
reader.dataformat.xlsx <- function(x, data.file, workbook.name, ...)
{
  require.package('xlsx')

  wb <- loadWorkbook(x)
  sheets <- getSheets(wb)

  for (sheet.name in names(sheets))
  {
    variable.name <- paste(workbook.name, clean.variable.name(sheet.name), sep = ".")
    tryCatch(assign(variable.name,
                    read.xlsx(x,
                              sheetName = sheet.name,
                              header = TRUE),
                    envir = .TargetEnv),
             error = function(e)
             {
               warning(paste("The worksheet", sheet.name, "didn't load correctly."))
             })
  }
}