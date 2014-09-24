#' Data formats
#'
#' Functions to help selecting the correct reader for a given file name.
#'
#' @param x Path to a file.
#' @param check_exists Check if file exists (default).
#' @param override_extension Alternative file extension (default: use extension
#'   from \code{x}).
#'
#' @return An object of class \code{dataformat}
#'
#' @export
#'
#' @examples
#' \dontrun{dataformat("my/data/file.csv.bz2")}
dataformat <- function(x, override_extension = NULL, check_exists = is.character(x), ...) {
  if (is.dataformat(x))
    return(x)

  if (length(x) != 1L)
    stop("x must be an atomic value (of length 1)")
  base <- get_basename(x)
  if (check_exists && !do_check_exists(x))
    stop("file ", file_name, " does not exist")

  if (is.null(override_extension)) {
    dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
    if (length(dotted_components) <= 1L)
      stop("cannot detect extension from file ", x)
    extensions <- paste(dotted_components[-1L], sep = ".")
  } else {
    extensions <- strsplit(override_extension, ".", fixed = TRUE)[[1L]]
  }

  for (i in rev(seq_along(extensions))[-1L]) {
    extensions[[i]] <- paste(extensions[i], extensions[i + 1L], sep = ".")
  }

  class_names <- paste0("dataformat.", extensions)
  class_names <- c(class_names, "dataformat")

  structure(x, class = class_names, file_extensions = extensions[[1L]])
}

get_basename <- function(x) UseMethod("get_basename", x)
get_basename.default <- function(x) stop("x must be either character or connection")
get_basename.character <- function(x) basename(x)
get_basename.connection <- function(x) basename(summary(x)[['description']])

do_check_exists <- function(x) UseMethod("do_check_exists", x)
do_check_exists.character <- function(x) file.exists(x)
do_check_exists.connection <- function(x) {
  warning("cannot check existence of connection")
  TRUE
}

#' @rdname dataformat
as.dataformat <- dataformat

#' @rdname dataformat
is.dataformat <- function(x) {
  "dataformat" %in% class(x)
}
