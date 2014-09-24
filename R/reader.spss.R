#' Read an SPSS file with a .sav file extension.
#'
#' This function will load the specified SPSS file into memory. It will
#' convert the resulting list object into a data frame before inserting the
#' data set into the global environment.
#'
#' @param data.file The name of the data file to be read.
#' @param x The path to the data set to be loaded.
#' @param variable.name The name to be assigned to in the global environment.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.spss('example.sav', 'data/example.sav', 'example')}
reader.dataformat.spss <- function(x, data.file, variable.name, ...)
{
  require.package('foreign')

  assign(variable.name,
         read.spss(x, to.data.frame = TRUE),
         envir = .TargetEnv)
}
