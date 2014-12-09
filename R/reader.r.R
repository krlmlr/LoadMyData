#' @details
#' \code{r}, \code{R}: An R source file.  All variables created by this file
#'   are returned.  (This is a way of generating data sets dynamically, as in
#'   many Monte Carlo applications.)
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.r <- function(x, ...)
{
  env <- new.env()
  source(x, local = env)
  as.list(env)
}

#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.R <- reader.dataformat.r
