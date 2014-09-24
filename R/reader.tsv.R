#' Read a tab separated values (.tsv or .tab) file.
#'
#' This function will load a data set stored in the TSV file format into
#' the specified global variable binding.
#'
#' @param data.file The name of the data file to be read.
#' @param x The path to the data set to be loaded.
#' @param variable.name The name to be assigned to in the global environment.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.tsv('example.tsv', 'data/example.tsv', 'example')}
reader.dataformat.tsv <- function(x, data.file, variable.name, ...)
{
  if (grepl('\\.zip$', x))
  {
    tmp.dir <- tempdir()
    tmp.path <- file.path(tmp.dir, data.file)
    file.copy(x, tmp.path)
    unzip(x, exdir = tmp.dir)
    x <- file.path(tmp.dir, sub('\\.zip$', '', data.file))
  }

  assign(variable.name,
         read.csv(x,
                  header = TRUE,
                  sep = '\t'),
         envir = .TargetEnv)
}
