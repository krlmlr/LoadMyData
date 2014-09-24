#' Read a comma separated values (.csv) file.
#'
#' This function will load a data set stored in the CSV file format into
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
#' \dontrun{reader.csv('example.csv', 'data/example.csv', 'example')}
reader.dataformat.csv <- function(x, variable.name, ...)
{
  assign(variable.name,
         read.csv(x,
                  header = TRUE,
                  sep = ','),
         envir = .TargetEnv)
}

#' @export
#' @rdname reader.dataformat.csv
reader.dataformat.csv.zip <- function(x, data.file, ...)
{
  tmp.dir <- tempdir()
  tmp.path <- file.path(tmp.dir, data.file)
  file.copy(x, tmp.path)
  unzip(x, exdir = tmp.dir)
  x <- file.path(tmp.dir, sub('\\.zip$', '', data.file))

  reader(dataformat(x), ...)
}
