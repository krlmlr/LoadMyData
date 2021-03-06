#' Read a DCF file into an R list.
#'
#' This function will read a DCF file and translate the resulting
#' data frame into a list. The DCF format is used throughout LoadMyData
#' for configuration settings and ad hoc file format specifications.
#'
#' @param filename A character vector specifying the DCF file to be
#'   translated.
#'
#' @return Returns a list containing the entries from the DCF file.
#'
#' @export
#'
#' @examples
#' \dontrun{translate.dcf(file.path('config', 'global.dcf'))}
translate.dcf <- function(filename)
{
  settings <- read.dcf(filename)

  tmp <- list()

  for (name in colnames(settings))
  {
    tmp[[name]] <- as.character(settings[1, name])
  }

  return(tmp)
}
