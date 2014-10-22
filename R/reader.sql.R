#' Read a database described in a .sql file.
#'
#' This function will load data from a SQL database based on configuration
#' information found in the specified .sql file. The .sql file must specify
#' a database to be accessed. All tables from the database, one specific tables
#' or one specific query against any set of tables may be executed to generate
#' a data set.
#'
#' queries can support string interpolation to execute code snippets using mustache syntax (http://mustache.github.io). This is used
#' to create queries that depend on data from other sources. Code delimited is \{\{...\}\}
#'
#' Example: query: SELECT * FROM my_table WHERE id IN (\{\{ids\}\}).
#' Here ids is a vector previously loaded into the Global Environment through LoadMyData
#'
#' Examples of the DCF format and settings used in a .sql file are shown
#' below:
#'
#' Example 1
#' type: mysql
#' user: sample_user
#' password: sample_password
#' host: localhost
#' dbname: sample_database
#' table: sample_table
#'
#' Example 2
#' type: mysql
#' user: sample_user
#' password: sample_password
#' host: localhost
#' port: 3306
#' socket: /Applications/MAMP/tmp/mysql/mysql.sock
#' dbname: sample_database
#' table: sample_table
#'
#' Example 3
#' type: sqlite
#' dbname: /path/to/sample_database
#' table: sample_table
#'
#' Example 4
#' type: sqlite
#' dbname: /path/to/sample_database
#' query: SELECT * FROM users WHERE user_active == 1
#'
#' Example 5
#' type: sqlite
#' dbname: /path/to/sample_database
#' table: *
#'
#' Example 6
#' type: postgres
#' user: sample_user
#' password: sample_password
#' host: localhost
#' dbname: sample_database
#' table: sample_table
#'
#' Example 7
#' type: odbc
#' dsn: sample_dsn
#' user: sample_user
#' password: sample_password
#' dbname: sample_database
#' query: SELECT * FROM sample_table
#'
#' Example 8
#' type: oracle
#' user: sample_user
#' password: sample_password
#' dbname: sample_database
#' table: sample_table
#'
#' Example 9
#' type: jdbc
#' class: oracle.jdbc.OracleDriver
#' classpath: /path/to/ojdbc5.jar (or set in CLASSPATH)
#' user: scott
#' password: tiger
#' url: jdbc:oracle:thin:@@myhost:1521:orcl
#' query: select * from emp
#'
#' Example 10
#' type: heroku
#' classpath: /path/to/jdbc4.jar (or set in CLASSPATH)
#' user: scott
#' password: tiger
#' host: heroku.postgres.url
#' port: 1234
#' dbname: herokudb
#' query: select * from emp
#'
#' @param x The path to the data set to be loaded.
#' @param ... Further arguments.
#'
#' @return No value is returned; this function is called for its side effects.
#'
#' @export
#'
#' @examples
#' \dontrun{reader.sql('example.sql', 'data/example.sql', 'example')}
#'
#' @include require.package.R
reader.dataformat.sql <- function(x, ...)
{
  database.info <- translate.dcf(x)

  if (! is.null(database.info[['connection']]))
  {
    connection_filename <- paste("data/", database.info[['connection']],".sql-connection", sep="")
    connection.info <- translate.dcf(connection_filename)

    # Allow .sql to override options defined in .connection
    database.info <- modifyList(connection.info, database.info)
  }

  class(database.info) <- c(paste0("dbinfo.", database.info[['type']]), "dbinfo")
  reader(database.info, ...)
}

#' @export
reader.dbinfo.odbc <- function(x, ...) {
    .require.package('RODBC')

    connection.string <- paste('DSN=', x[['dsn']], ';',
                               'UID=', x[['user']], ';',
                               'PWD=', x[['password']], ';',
                               'DATABASE=', x['dbname'],
                               sep = '')
    connection <- RODBC::odbcDriverConnect(connection.string)
    on.exit(RODBC::odbcClose(connection), add = TRUE)

    list(RODBC::sqlQuery(connection, x[['query']]))
}

#' @export
reader.dbinfo.mysql <- function(x, ...) {
    .require.package('RMySQL')

    mysql.driver <- DBI::dbDriver("MySQL")

    # Default value for 'port' in mysqlNewConnection is 0.
    if (is.null(x[['port']]))
    {
      x[['port']] <- 0
    }

    connection <- DBI::dbConnect(mysql.driver,
                            user = x[['user']],
                            password = x[['password']],
                            host = x[['host']],
                            dbname = x[['dbname']],
                            port = as.integer(x[['port']]),
                            unix.socket = x[['socket']])
    DBI::dbGetQuery(connection, "SET NAMES 'utf8'") # Switch to utf-8 strings

    on.exit(DBI::dbDisconnect(connection), add = TRUE)
    NextMethod(.Generic, x, connection = connection, ...)
}

#' @export
reader.dbinfo.sqlite <- function(x, ...) {
    .require.package('RSQLite')

    sqlite.driver <- DBI::dbDriver("SQLite")

    connection <- DBI::dbConnect(sqlite.driver,
                            dbname = x[['dbname']])

    on.exit(DBI::dbDisconnect(connection), add = TRUE)
    NextMethod(.Generic, x, connection = connection, ...)
}

#' @export
reader.dbinfo.postgres <- function(x, ...) {
    .require.package('RPostgreSQL')

    pgsql.driver <- DBI::dbDriver("PostgreSQL")

    args <- intersect(names(x), c('user', 'password', 'host', 'dbname'))
    connection <- do.call(DBI::dbConnect, c(list(pgsql.driver), x[args]))

    on.exit(DBI::dbDisconnect(connection), add = TRUE)
    NextMethod(.Generic, x, connection = connection, ...)
}

#' @export
reader.dbinfo.oracle <- function(x, ...) {
    .require.package('ROracle')

    oracle.driver <- DBI::dbDriver("Oracle")

    # Default value for 'port' in mysqlNewConnection is 0.
    if (is.null(x[['port']]))
    {
      x[['port']] <- 0
    }

    connection <- DBI::dbConnect(oracle.driver,
                            user = x[['user']],
                            password = x[['password']],
                            dbname = x[['dbname']])

    on.exit(DBI::dbDisconnect(connection), add = TRUE)
    NextMethod(.Generic, x, connection = connection, ...)
}

#' @export
reader.dbinfo.jdbc <- function(x, ...) {
    .require.package('RJDBC')

    ident.quote <- NA
    if('identquote' %in% names(x))
       ident.quote <- x[['identquote']]

    if(is.null(x[['classpath']])) {
      x[['classpath']] = ''
    }

    rjdbc.driver <- RJDBC::JDBC(x[['class']], x[['classpath']], ident.quote)
    connection <- DBI::dbConnect(rjdbc.driver,
                            x[['url']],
                            user = x[['user']],
                            password = x[['password']])

    on.exit(DBI::dbDisconnect(connection), add = TRUE)
    NextMethod(.Generic, x, connection = connection, ...)
}

#' @export
reader.dbinfo.heroku <- function(x, ...) {
    .require.package('RJDBC')

    if(is.null(x[['classpath']])) {
      x[['classpath']] <- ''
    }

    x[['class']] <- 'org.postgresql.Driver'

    x[['url']] <- paste('jdbc:postgresql://', x[['host']],
        ':', x[['port']],
        '/', x[['dbname']],
        '?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory', sep = '')

    rjdbc.driver <- RJDBC::JDBC(x[['class']], x[['classpath']])
    connection <- DBI::dbConnect(rjdbc.driver,
                            x[['url']],
                            user = x[['user']],
                            password = x[['password']])

    on.exit(DBI::dbDisconnect(connection), add = TRUE)
    NextMethod(.Generic, x, connection = connection, ...)
}

#' @export
reader.dbinfo <- function(x, connection, ...) {
  # Added support for queries.
  # User should specify either a table name or a query to execute, but not both.
  table <- x[['table']]
  query <- x[['query']]

  # If both a table and a query are specified, favor the query.
  if (! is.null(table) && ! is.null(query))
  {
      warning(paste("'query' parameter in ",
                    x,
                    " overrides 'table' parameter.",
                    sep = ''))
      table <- NULL
  }

  if (is.null(table) && is.null(query))
  {
    warning("Either 'table' or 'query' must be specified in a .sql file")
    return(list())
  }

  if (is.null(query)) {
    if (table == '*')
    {
      tables <- DBI::dbListTables(connection)
    } else {
      if (DBI::dbExistsTable(connection, table)) {
        tables <- table
      } else {
        warning(paste('Table not found:', table))
        return(list())
      }
    }

    tables <- setNames(tables, clean.variable.name(tables))

    lapply(
      tables,
      function (table)
        try(DBI::dbReadTable(connection, table, row.names = NULL))
    )
  } else {
    # Do string interpolation
    # TODO: When whisker is updated add strict=FALSE
    if (length(grep('\\@\\{.*\\}', query)) != 0) {
      .require.package('GetoptLong')
      query <- GetoptLong::qq(query)
    } else if (length(grep('\\{\\{.*\\}\\}', query))) {
      .require.package('whisker')
      query <- whisker::whisker.render(query, data = .GlobalEnv)
    }
    list(try(DBI::dbGetQuery(connection, query)))
  }
}
