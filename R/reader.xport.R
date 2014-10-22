#' Read an SAS XPort file with a .xpt or .xport file extension.
#'
#' This function will load the specified SAS XPort file into memory.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
reader.dataformat.xport <- function(x, ...)
{
  .require.package('foreign')

  list(foreign::read.xport(x))
}

#' @rdname reader.dataformat.xport
#' @export
reader.dataformat.xpt <- reader.dataformat.xport
