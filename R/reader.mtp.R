#' Read a Minitab Portable Worksheet with an .mtp3 file extension.
#'
#' This function will load the specified Minitab Portable Worksheet into
#' memory.
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
#' \dontrun{reader.mtp('example.mtp', 'data/example.mtp', 'example')}
reader.dataformat.mtp <- function(x, data.file, variable.name, ...)
{
  .require.package('foreign')

  assign(variable.name,
         foreign::read.mtp(x),
         envir = .TargetEnv)
}
