#' Read an arbitrary file described in a .file file.
#'
#' This function will load all of the data sets described in the specified
#' .file file into the global environment. A .file file must contain DCF
#' that specifies the path to the data set and which extension should be
#' used from the dispatch table to load the data set.
#'
#' Examples of the DCF format and settings used in a .file file are shown
#' below:
#'
#' path: http://www.johnmyleswhite.com/LoadMyData/sample_data.csv
#' extension: csv
#'
#' @param x The path to the data set to be loaded.
#' @param ... Parameters passed to the invoked reader
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.file('example.file', 'data/example.file', 'example')}
reader.dataformat.file <- function(x, ...)
{
  file.info <- translate.dcf(x)
  file.format <- dataformat(file.info[['path']], override_extension = explicit_extension(file.info[['extension']], attr(x, "objname")))

  reader(file.format, ...)
}
