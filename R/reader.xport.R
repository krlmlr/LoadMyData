#' Read an SAS XPort file with a .xpt or .xport file extension.
#'
#' This function will load the specified SAS XPort file into memory.
#'
#' @param data.file The name of the data file to be read.
#' @param x The path to the data set to be loaded.
#' @param variable.name The name to be assigned to in the global environment.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.xport <- function(x, data.file, variable.name, ...)
{
  require.package('foreign')

  assign(variable.name,
         read.xport(x),
         envir = .TargetEnv)
}

#' @rdname reader.dataformat.xport
#' @export
reader.dataformat.xpt <- reader.dataformat.xport
