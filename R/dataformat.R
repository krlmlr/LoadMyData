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
    extensions <- paste(dotted_components[-1L], sep = ".")
  } else {
    extensions <- strsplit(override_extension, ".", fixed = TRUE)[[1L]]
  }

  for (i in rev(seq_along(extensions))[-1L]) {
    extensions[[i]] <- paste(extensions[i], extensions[i + 1L], sep = ".")
  }

  class_names <- paste0("dataformat.", extensions)
  class_names <- c(class_names, "dataformat")

  structure(file_name, class = class_names, file_extension = extensions[[1L]])
}

#' @rdname dataformat
as.dataformat <- dataformat

#' @rdname dataformat
is.dataformat <- function(x) {
  "dataformat" %in% class(x)
}
