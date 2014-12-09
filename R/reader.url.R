#' @details
#' \code{url}: Description of an arbitrary URL accessible through HTTP or FTP.
#'   See below for a description of the \code{.url} format.
#'
#' @section .url file format:
#' A \code{.url} file must contain DCF
#' that specifies the URL of the remote data source
#' and the type of data that is available remotely. Only one data source
#' per .url file is supported currently.
#'
#' Examples of the DCF format and settings used in a \code{.url} file are shown
#' below:
#'
#' Example 1:
#'
#' \preformatted{url: http://www.johnmyleswhite.com/LoadMyData/sample_data.csv
#' }
#'
#' Example 2:
#'
#' \preformatted{url: http://www.johnmyleswhite.com/LoadMyData/some?query
#' extension: .csv.bz2
#' }
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.url <- function(x, ...)
{
  url.info <- translate.dcf(x)
  url <- dataformat(
    url(url.info[['url']]),
    override_extension = url.info[['extension']])

  reader(url, ...)
}
