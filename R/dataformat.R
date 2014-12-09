#' Data formats
#'
#' Functions to help selecting the correct reader for a given file name.
#'
#' @param x Path to a file.
#' @param check_exists Check if file exists (default).
#' @param override_extension Alternative file extension (default: use extension
#'   from \code{x}).
#' @param ... Further parameters.
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
    stop("file ", base, " does not exist")

  extensions <- get_extension(override_extension, base)
  objname <- clean.variable.name(get_objname(override_extension, base))

  class_names <- paste0("dataformat.", extensions)
  class_names <- c(class_names, "dataformat", attr(x, "class"))

  structure(x, class = class_names, file_extensions = extensions[[1L]], objname = objname)
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

get_extension <- function(x, base) UseMethod("get_extension", x)
get_extension.use_extension <- function(x, base) {
  dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
  if (length(dotted_components) <= 1L)
    stop("cannot detect extension from file ", base)
  dotted_components[length(dotted_components)]
}
get_extension.NULL <- get_extension.use_extension
get_extension.parent_extension <- function(x, base) {
  dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
  if (length(dotted_components) <= 2L)
    stop("cannot detect parent extension from file ", base)
  dotted_components[length(dotted_components) - 1]
}
get_extension.explicit_extension <- function(x, base) {
  res <- x[["extension"]]
  if (is.null(res)) res <- get_extension.use_extension(x, base)
  res
}
get_extension.character <- function(x, base) {
  dotted_components <- strsplit(x, ".", fixed = TRUE)[[1L]]
  dotted_components[length(dotted_components)]
}

get_objname <- function(x, base) UseMethod("get_objname", x)
get_objname.use_extension <- function(x, base) {
  dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
  if (length(dotted_components) <= 1L)
    stop("cannot detect objname from file ", base)
  paste(head(dotted_components, -1L), collapse = ".")
}
get_objname.NULL <- get_objname.use_extension
get_objname.parent_extension <- function(x, base) {
  dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
  if (length(dotted_components) <= 2L)
    stop("cannot detect objname from file ", base)
  paste(head(dotted_components, -2L), collapse = ".")
}
get_objname.explicit_extension <- function(x, base) {
  res <- x[["objname"]]
  if (is.null(res)) res <- get_objname.use_extension(x, base)
  res
}
get_objname.character <- function(x, base) {
  dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
  dotted_components[[1L]]
}

#' Placeholders for override_extension
#'
#' Use as values for the \code{override_extension} parameter to
#' \code{\link{dataformat}}.
#'
#' @export
use_extension <- function() structure(NA_integer_, class = "use_extension")

#' @rdname use_extension
#' @export
parent_extension <- function() structure(NA_integer_, class = "parent_extension")

#' @rdname use_extension
#'
#' @param extension Alternate extension
#' @param objname Alternate objname
#'
#' @export
explicit_extension <- function(extension = NULL, objname = NULL)
  structure(list(extension = extension, objname = objname), class = "explicit_extension")

#' @rdname dataformat
as.dataformat <- dataformat

#' @rdname dataformat
is.dataformat <- function(x) {
  "dataformat" %in% class(x)
}
