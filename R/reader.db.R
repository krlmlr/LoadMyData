#' Read a SQlite3 database with a (.db) file extension.
#'
#' This function will load all of the data sets stored in the SQlite3
#' database into the global environment. If you want to specify a single
#' table or query to execute against the database, move it elsewhere and
#' use a .sql file interpreted by \code{\link{reader.dataformat.sql}}.
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.db('example.db', 'data/example.db', 'example')}
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
