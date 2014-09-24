#' Read the Weka file format.
#'
#' This function will load a data set stored in the Weka file format into
#' the specified global variable binding.
#'
#' @param data.file The name of the data file to be read.
#' @param filename The path to the data set to be loaded.
#' @param variable.name The name to be assigned to in the global environment.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.arff('example.arff', 'data/example.arff', 'example')}
reader.dataformat.arff <- function(data.file, filename, variable.name)
{
  require.package('foreign')

  assign(variable.name,
         read.arff(filename),
         envir = .TargetEnv)
}