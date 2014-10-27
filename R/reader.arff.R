#' @details
#' \code{arff}: Weka Attribute-Relation File Format via \code{foreign::\link[foreign]{read.arff}}
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.arff <- function(x, ...)
{
  .require.package('foreign')
  read_atomic(x, .f = foreign::read.arff)
}
