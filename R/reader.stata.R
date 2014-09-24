#' Read a Stata file with a .stata file extension.
#'
#' This function will load the specified Stata file into memory.
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
#' \dontrun{reader.stata('example.stata', 'data/example.stata', 'example')}
reader.dataformat.stata <- function(x, data.file, variable.name, ...)
{
  require.package('foreign')

  assign(variable.name,
         read.dta(x),
         envir = .TargetEnv)
}
