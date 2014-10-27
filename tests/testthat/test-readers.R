context('Readers')

testfun_dataframe_contents <- function(variable_name, envir = parent.frame()) {
  expect_that(nrow(get(variable_name, envir)), equals(5))
  expect_that(ncol(get(variable_name, envir)), equals(2))
  expect_that(get(variable_name, envir)[5, 2], equals(11))
}

testfun_dataframe <- function(variable_name, envir = parent.frame()) {
  expect_that(names(get(variable_name, envir)), equals(c('N', 'Prime')))
  testfun_dataframe_contents(variable_name, envir)
}

testfun_dataframe_ucase <- function(variable_name, envir = parent.frame()) {
  expect_that(names(get(variable_name, envir)), equals(c('N', 'PRIME')))
  testfun_dataframe_contents(variable_name, envir)
}

test_dataframe <- function(basename, variable_names, filename = NULL, expected_warning = NULL, testfun = testfun_dataframe) {
  if(is.null(filename)) {
    filename <- file.path(system.file('example_data',
                                      package = 'LoadMyData'),
                          basename)
  }

  if (is.null(expected_warning)) {
    res <- reader(filename)
  } else {
    expect_warning(res <- reader(filename), expected_warning)
  }
  res <- as.environment(res)

  expect_equal(ls(res), variable_names)
  for (variable_name in variable_names) {
    testfun(variable_name, res)
  }
}

check_dataframe_contents <- function(res) {
  expect_that(nrow(res), equals(5))
  expect_that(ncol(res), equals(2))
  expect_that(res[5, 2], equals(11))
}

check_dataframe <- function(res) {
  expect_that(names(res), equals(c('N', 'Prime')))
  check_dataframe_contents(res)
}

check_results <- function(res, expected_results) {
  if (is.null(expected_results)) {
    check_dataframe(res)
    return()
  }

  expect_equal(names(res), names(expected_results))
  lapply(
    seq_along(expected_results),
    function (x) {
      check_results(res[[x]], expected_results[[x]])
    }
  )

  return()
}

test_reader <- function(basename, expected_results, expected_warning = NULL) {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        basename)

  if (is.null(expected_warning)) {
    res <- reader(filename)
  } else {
    expect_warning(res <- reader(filename), expected_warning)
  }

  check_results(res, expected_results)
}

test_that('Example 01: CSV Data file', {
  test_reader('example_01.csv', list(example.01=NULL))
})


test_that('Example 02: .csv.bz2', {
  test_reader('example_02.csv.bz2', list(example.02=NULL))
})


test_that('Example 03: csv.zip data', {
  test_reader('example_03.csv.zip', list(example.03=NULL))
})


test_that('Example 04: CSV Data File with GZip Compression', {
  test_reader('example_04.csv.gz', list(example.04=NULL))
})


test_that('Example 01a: CSV2 Data file', {
  test_reader('example_01.csv2', list(example.01=NULL))
})


test_that('Example 02a: .csv2.bz2', {
  test_reader('example_02.csv2.bz2', list(example.02=NULL))
})


test_that('Example 03a: csv2.zip data', {
  test_reader('example_03.csv2.zip', list(example.03=NULL))
})


test_that('Example 04a: CSV2 Data File with GZip Compression', {
  test_reader('example_04.csv2.gz', list(example.04=NULL))
})

test_that('Example 05: TSV Data File', {
  test_reader('example_05.tsv', list(example.05=NULL))
})


test_that('Example 06: TSV Data File with BZip2 Compression', {
  test_reader('example_06.tsv.bz2', list(example.06=NULL))
})


test_that('Example 07: TSV Data File with Zip Compression', {
  test_reader('example_07.tsv.zip', list(example.07=NULL))
})


test_that('Example 08: TSV Data File with GZip Compression', {
  test_reader('example_08.tsv.gz', list(example.08=NULL))
})

test_that('Example 09: WSV Data File', {
  test_reader('example_09.wsv', list(example.09=NULL))
})


test_that('Example 10: WSV Data File with BZip2 Compression', {
  test_reader('example_10.wsv.bz2', list(example.10=NULL))
})


test_that('Example 11: WSV Data File with Zip Compression', {
  test_reader('example_11.wsv.zip', list(example.11=NULL))
})


test_that('Example 12: WSV Data File with GZip Compression', {
  test_reader('example_12.wsv.gz', list(example.12=NULL))
})


test_that('Example 13: RData Data File with .RData Extension', {
  test_reader('example_13.RData', list(m=NULL))
})


test_that('Example 14: RData Data File with .rda Extension', {
  test_reader('example_14.rda', list(n=NULL))
})


test_that('Example 15: URL File with .url Extension', {
  skip("NYI")
})


test_that('Example 16: TSV File with .tab Extension', {
  test_reader('example_16.tab', list(example.16=NULL))
})


test_that('Example 17: TSV File with .tab Extension and BZip2 Compression', {
  test_reader('example_17.tab.bz2', list(example.17=NULL))
})


test_that('Example 18: TSV File with .tab Extension and Zip Compression', {
  test_reader('example_18.tab.zip', list(example.18=NULL))
})


test_that('Example 19: TSV File with .tab Extension and GZip Compression', {
  test_reader('example_19.tab.gz', list(example.19=NULL))
})


test_that('Example 20: WSV File with .txt Extension', {
  test_reader('example_20.txt', list(example.20=NULL))
})


test_that('Example 21: WSV File with .txt Extension and BZip2 Compression', {
  test_reader('example_21.txt.bz2', list(example.21=NULL))
})


test_that('Example 22: WSV File with .txt Extension and Zip Compression', {
  test_reader('example_22.txt.zip', list(example.22=NULL))
})


test_that('Example 23: WSV File with .txt Extension and GZip Compression', {
  test_reader('example_23.txt.gz', list(example.23=NULL))
})


test_that('Example 24: R File with .R Extension', {
  test_reader('example_24.R', list(example.24=NULL))
})


test_that('Example 25: R File with .r Extension', {
  test_reader('example_25.r', list(example.25=NULL))
})


test_that('Example 26: Excel 2007 File with .xls Extension', {
  test_reader('example_26.xls', list(Sheet1=NULL))
})


test_that('Example 27: Excel 2011 File with .xlsx Extension', {
  skip("NYI")
  test_reader('example_27.xlsx', list(Sheet1=NULL))
})


test_that('Example 28: SQLite3 Support with .sql Extension with table = "..."', {
  filename <- 'example_28.sql'
  sql.file <- data.frame(type = 'sqlite',
                         dbname = file.path(system.file('example_data',
                                                        package = 'LoadMyData'),
                                            'example_28.db'),
                         table = 'example_28')
  write.dcf(sql.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  test_dataframe(filename = 'example_28.sql', variable_names = 'example.28')
})


test_that('Example 29: SQLite3 Support with .sql Extension with query = "SELECT * FROM ..."', {

  filename <- 'example_29.sql'
  sql.file <- data.frame(type = 'sqlite',
                         dbname = file.path(system.file('example_data',
                                                        package = 'LoadMyData'),
                                            'example_29.db'),
                         query = 'SELECT N, Prime FROM example_29 ORDER BY Prime')
  write.dcf(sql.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  test_dataframe(filename = 'example_29.sql', variable_names = 'SELECT.N..Prime.FROM.example.29.ORDER.BY.Prime')
})


test_that('Example 30: SQLite3 Support with .sql Extension and table = "*"', {

  filename <- 'example_30.sql'
  sql.file <- data.frame(type = 'sqlite',
                         dbname = file.path(system.file('example_data',
                                                        package = 'LoadMyData'),
                                            'example_30.db'),
                         table = '*')
  write.dcf(sql.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  test_dataframe(filename = 'example_30.sql', variable_names = c('example.30a', 'example.30b'))
})


test_that('Example 31: SQLite3 Support with .db Extension', {
  test_dataframe('example_31.db', c('example.31a', 'example.31b'))
})


test_that('Example 32: Weka Support with .arff Extension', {
  test_reader('example_32.arff', list(example.32=NULL))
})


test_that('Example 33: Arbitary File Support with .file File Pointing to .db File', {

  filename <- 'example_33.file'
  info.file <- data.frame(path = file.path(system.file('example_data',
                                                        package = 'LoadMyData'),
                                            'example_28.db'),
                         extension = 'db')
  write.dcf(info.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  skip("#13")
  test_dataframe(filename = 'example_33.file', variable_names = 'example.33')
})


test_that('Example 34: MP3 Support with .mp3 Extension', {
  skip("NYI")
})


test_that('Example 35: PPM Support with .ppm Extension', {
  testfun <- function(variable_name, envir = parent.frame()) {
    expect_that(as.character(class(get(variable_name, envir))), equals('pixmapRGB'))
  }

  test_dataframe(
    'example_35.ppm', 'example.35',
    expected_warning = " is NULL so the result will be NULL",
    testfun = testfun
  )
})


test_that('Example 36: dBase Support with .dbf Extension', {
  test_reader('example_36.dbf', list(example.36=NULL))
})


test_that('Example 37: SPSS Support with .sav Extension', {
  test_dataframe('example_37.sav', 'example.37',
                 expected_warning = "Unrecognized record type 7, subtype 18 encountered in system file")
})


test_that('Example 38: SPSS Support with .sav Extension / Alternative Generation', {
  test_dataframe('example_38.sav', 'example.38',
                 expected_warning = "Unrecognized record type 7, subtype 18 encountered in system file")
})


test_that('Example 39: Stata Support with .dta Extension', {
  test_reader('example_39.dta', list(example.39=NULL))
})


test_that('Example 40: Stata Support with .dta Extension / Alternative Generation', {
  test_reader('example_40.dta', list(example.40=NULL))
})


test_that('Example 41: SAS Support with .xport Extension', {
  test_dataframe('example_41.xport', 'example.41', testfun = testfun_dataframe_ucase)
})


test_that('Example 42: SAS Support with .xpt Extension', {
  test_dataframe('example_42.xpt', 'example.42', testfun = testfun_dataframe_ucase)
})


test_that('Example 43: ElasticSearch Support with .es Extension', {
  skip("NYI")
})


test_that('Example 44: Arbitary File Support with .file File Pointing to .csv File', {

  filename <- 'example_44.file'
  info.file <- data.frame(path = file.path(system.file('example_data',
                                                       package = 'LoadMyData'),
                                           'example_01.csv'))
  write.dcf(info.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  test_dataframe(filename = 'example_44.file', variable_names = 'example.44')
})
