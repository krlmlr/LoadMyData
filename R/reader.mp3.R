#' @details
#' \code{mp3}: MP3 file format via \code{tuneR::\link[tuneR]{read.MP3}}.
#'   Useful for working with audio files as a data set.
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.mp3 <- function(x, ...)
{
  .require.package('tuneR')
  read_atomic(x, .f = tuneR::readMP3)
}
