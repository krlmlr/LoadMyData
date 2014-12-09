#' @details
#' \code{db}: SQlite3 database via  \code{RSQLite::\link[RSQLite]{dbConnect}}.
#'   Each table will be read, the return value is a list. (If you want to specify
#'   a single table or query to execute against the database, move it elsewhere
#'   and use a \code{.sql} file interpreted by \code{\link{reader.dataformat.sql}}.)
#'
#' @usage NULL
#' @rdname reader
#' @export
reader.dataformat.db <- function(x, ...)
{
  .require.package('RSQLite')

  sqlite.driver <- DBI::dbDriver("SQLite")
  connection <- DBI::dbConnect(sqlite.driver,
                          dbname = x)
  on.exit(DBI::dbDisconnect(connection), add = TRUE)

  tables <- DBI::dbListTables(connection)
  tables <- setNames(tables, clean.variable.name(tables))

  lapply(
    tables,
    function(table)
      DBI::dbReadTable(connection, table, row.names = NULL)
  )
}
