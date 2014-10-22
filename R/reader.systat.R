#' Read a Systat file with a .sys or .syd file extension.
#'
#' This function will load the specified Systat file into memory.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.systat('example.sys', 'data/example.sys', 'example')}
reader.dataformat.systat <- function(x, ...)
{
  .require.package('foreign')

  list(foreign::read.systat(x))
}
