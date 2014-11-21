#' Read a data file
#'
#' This function loads a data set.  The data format is determined by the
#' file extension, or by the class if an object of class \code{\link{dataformat}}
#' is passed.
#'
#' The following file extensions are supported:
#'
#' @usage reader(x, ...)
#'
#' @param x An object of class \code{dataformat}, will be coerced using
#' \code{\link{as.dataformat}} if necessary.
#' @param ... Further arguments.
#'
#' @return A list where each element corresponds to a loaded data item.
#'   This is always a named list; the name is derived from the input file name
#'   using \code{\link{clean.variable.name}}.  Readers that support files with
#'   multiple data sets (e.g., for SQL databases, Excel spreadsheets,
#'   ZIP archives, \ldots) will return a nested list.
#'
#' @export
#'
#' @examples
#' \dontrun{reader('example.csv')}
reader <- function(x, ...) UseMethod("reader", x)

#' @export
reader.dataformat <- function(x, ...)
  stop("Don't know how to load ", x, ". Perhaps you need to load a package that enhances the LoadMyData package.")

#' @export
reader.default <- function(x, ...)
  reader(as.dataformat(x), ...)

read_atomic <- function(.dataformat, .f, ...) {
  set_objname(list(.f(.dataformat, ...)), .dataformat)
}

set_objname <- function(x, dataformat) {
  setNames(x, attr(dataformat, "objname"))
}
