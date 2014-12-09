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

read_atomic <- function(.dataformat, .f, .envir = parent.frame(), ...) {
  if ("connection" %in% class(.dataformat)) {
    objname <- attr(.dataformat, "objname")
    file_extensions <- attr(.dataformat, "file_extensions")
    tmpname <- tempfile(
      pattern = sprintf("%s_", objname),
      fileext = sprintf(".%s", file_extensions)
    )
    on.exit(unlink(tmpfile), add = TRUE)

    tmpfile <- file(tmpname, "wb")

    tryCatch(
      repeat {
        data <- readBin(.dataformat, what = "raw", n = 16384)
        if (length(data) == 0L)
          break
        writeBin(data, tmpfile)
      },
      finally = close(tmpfile))

    tmp_dataformat <- dataformat(
      tmpname, override_extension = explicit_extension(file_extensions, objname))

    eval(substitute(read_atomic_worker(.dataformat = tmp_dataformat, .f = .f, ...)), .envir)
  } else
    eval(substitute(read_atomic_worker(.dataformat = .dataformat, .f = .f, ...)), .envir)
}

read_atomic_worker <- function(.dataformat, .f, .envir = parent.frame(), ...) {
  res <- eval(substitute(.f(.dataformat, ...)), .envir)
  set_objname(list(res), .dataformat)
}

set_objname <- function(x, dataformat) {
  setNames(x, attr(dataformat, "objname"))
}
