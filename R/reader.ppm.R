#' Read a PPM file with a .ppm file extension.
#'
#' This function will load the specified PPM file into memory using the
#' pixamp package. This is useful for working with image files as a data
#' set.
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
#' \dontrun{reader.ppm('example.ppm', 'data/example.ppm', 'example')}
reader.dataformat.ppm <- function(filename, data.file, variable.name)
{
  require.package('pixmap')

  assign(variable.name,
         read.pnm(filename),
         envir = .TargetEnv)
}
