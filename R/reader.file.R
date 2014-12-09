#' @details
#' \code{file}: An arbitrary file that describes one or several datasets, see
#'   below for a description of the \code{.file} format.
#'
#' @section .file file format:
#' A \code{.file} file must contain DCF
#' that specifies the path to the data set and which extension should be
#' used from the dispatch table to load the data set.
#'
#' Examples of the DCF format and settings used in a \code{.file} file are shown
#' below:
#'
#' \preformatted{path: http://www.johnmyleswhite.com/LoadMyData/sample_data.csv
#' extension: csv}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.file <- function(x, ...)
{
  file.info <- translate.dcf(x)
  file.format <- dataformat(file.info[['path']], override_extension = explicit_extension(file.info[['extension']]))

  set_objname(list(reader(file.format, ...)), x)
}
