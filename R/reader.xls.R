#' Read an Excel 2004 file with a .xls file extension.
#'
#' This function will load the specified Excel file into memory using the
#' gdata package. Each sheet of the Excel workbook will be read into a
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
#' \dontrun{reader.xls('example.xls', 'data/example.xls', 'example')}
reader.dataformat.xls <- function(x, data.file, workbook.name, ...)
{
  .require.package('gdata')

  sheets <- gdata::sheetNames(x)

  for (sheet.name in sheets)
  {
    variable.name <- paste(workbook.name, clean.variable.name(sheet.name), sep = ".")
    tryCatch(assign(variable.name,
                    gdata::read.xls(x,
                             sheet = sheet.name),
                    envir = .TargetEnv),
             error = function(e)
             {
               warning(paste("The worksheet", sheet.name, "didn't load correctly."))
             })
  }
}
