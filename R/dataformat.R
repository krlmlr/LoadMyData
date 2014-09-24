#' Data formats
#'
#' Functions to help selecting the correct loader for a given file name.
#'
#' @param file_name Path to a file.
#' @param check_exists Check if file exists (default).
#' @param override_extension Alternative file extension (default: use extension
#'   from \code{file_name}).
#' @param x An object.
#'
#' @return An object of class \code{dataformat}
#'
#' @export
#'
#' @examples
#' \dontrun{dataformat("my/data/file.csv.bz2")}
dataformat <- function(file_name, check_exists = TRUE, override_extension = NULL) {
  if (!is.character(file_name))
    stop("file_name must be a character")
  if (length(file_name) != 1L)
    stop("file_name must be an atomic value (of length 1)")
  if (check_exists && !file.exists(file_name))
    stop("file ", file_name, " does not exist")
  base <- basename(file_name)
  if (is.null(override_extension)) {
    dotted_components <- strsplit(base, ".", fixed = TRUE)[[1L]]
    if (length(dotted_components) <= 1L)
      stop("cannot detect extension from file ", file_name)
    override_extension <- tail(dotted_components, 1L)
  }
  class_names <- sprintf("dataformat.%s", override_extension)
  class_names <- c(class_names, "dataformat")
  structure(file_name, class = class_names)
}

#' @rdname dataformat
as.dataformat <- dataformat

#' @rdname dataformat
is.dataformat <- function(x) {
  "dataformat" %in% class(x)
}
