#' Read a data file
#'
#' This function loads a data set.  The data format is determined by the
#' file extension, or by the class if an object of class \code{\link{dataformat}}
#' is passed.
#'
#' @param x An object of class \code{dataformat}, will be coerced using
#' \code{\link{as.dataformat}} if necessary.
#' @param ... Further arguments.
#'
#' @return A list where each element corresponds to a loaded data item.
#'   Often, this will be an unnamed list with just one element.
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

.TargetEnv <- .GlobalEnv
