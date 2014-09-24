#' Read an Octave file with a .m file extension.
#'
#' This function will load the specified Octave file into memory.
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
#' \dontrun{reader.octave('example.m', 'data/example.m', 'example')}
reader.dataformat.octave <- function(data.file, filename, variable.name)
{
  require.package('foreign')

  assign(variable.name,
         read.octave(filename),
         envir = .TargetEnv)
}
