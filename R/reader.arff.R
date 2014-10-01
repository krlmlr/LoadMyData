#' Read the Weka file format.
#'
#' This function will load a data set stored in the Weka file format into
#' the specified global variable binding.
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
#' \dontrun{reader.arff('example.arff', 'data/example.arff', 'example')}
reader.dataformat.arff <- function(x, data.file, variable.name, ...)
{
  .require.package('foreign')

  assign(variable.name,
         foreign::read.arff(x),
         envir = .TargetEnv)
}
