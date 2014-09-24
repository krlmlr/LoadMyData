#' Read an Epi Info file with a .rec file extension.
#'
#' This function will load all of the data sets stored in the specified
#' Epi Info file into the global environment.
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
#' \dontrun{reader.epiinfo('example.rec', 'data/example.rec', 'example')}
reader.dataformat.epiinfo <- function(x, data.file, variable.name, ...)
{
  require.package('foreign')

  assign(variable.name,
         read.epiinfo(x),
         envir = .TargetEnv)
}
