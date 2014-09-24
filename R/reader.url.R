#' Read a remote file described in a .url file.
#'
#' This function will load data from a remote source accessible through
#' HTTP or FTP based on configuration information found in the specified
#' .url file. The .url file must specify the URL of the remote data source
#' and the type of data that is available remotely. Only one data source
#' per .url file is supported currently.
#'
#' Examples of the DCF format and settings used in a .url file are shown
#' below:
#'
#' Example 1:
#'
#' \preformatted{url: http://www.johnmyleswhite.com/LoadMyData/sample_data.csv
#' }
#'
#' Example 1:
#'
#' \preformatted{url: http://www.johnmyleswhite.com/LoadMyData/some?query
#' extension: .csv.bz2
#' }
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments passed to the reader invoked.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.url('example.url', 'data/example.url', 'example')}
reader.dataformat.url <- function(x, ...)
{
  url.info <- translate.dcf(x)
  url <- dataformat(
    url(url.info[['url']]),
    override_extension = url.info[['extension']])

  reader(url, ...)
}
