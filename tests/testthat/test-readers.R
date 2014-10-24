context('Readers')

test_dataframe <- function(basename, variable.name) {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        basename)
  test_dataframe_file(filename, variable.name)
}

test_dataframe_file <- function(filename, variable.names) {
  with(reader(filename), {
    for (variable.name in variable.names) {
      expect_that(exists(variable.name), is_true())
      expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
      expect_that(nrow(get(variable.name)), equals(5))
      expect_that(ncol(get(variable.name)), equals(2))
      expect_that(get(variable.name)[5, 2], equals(11))
    }
  })
}

test_that('Example 01: CSV Data file', {
  test_dataframe('example_01.csv', 'example.01')
})


test_that('Example 02: .csv.bz2', {
  test_dataframe('example_02.csv.bz2', 'example.02')
})


test_that('Example 03: csv.zip data', {
  test_dataframe('example_03.csv.zip', 'example.03')
})


test_that('Example 04: CSV Data File with GZip Compression', {
  test_dataframe('example_04.csv.gz', 'example.04')
})


test_that('Example 01a: CSV2 Data file', {
  test_dataframe('example_01.csv2', 'example.01')
})


test_that('Example 02a: .csv2.bz2', {
  test_dataframe('example_02.csv2.bz2', 'example.02')
})


test_that('Example 03a: csv2.zip data', {
  test_dataframe('example_03.csv2.zip', 'example.03')
})


test_that('Example 04a: CSV2 Data File with GZip Compression', {
  test_dataframe('example_04.csv2.gz', 'example.04')
})

test_that('Example 05: TSV Data File', {
  test_dataframe('example_05.tsv', 'example.05')
})


test_that('Example 06: TSV Data File with BZip2 Compression', {
  test_dataframe('example_06.tsv.bz2', 'example.06')
})


test_that('Example 07: TSV Data File with Zip Compression', {
  test_dataframe('example_07.tsv.zip', 'example.07')
})


test_that('Example 08: TSV Data File with GZip Compression', {
  test_dataframe('example_08.tsv.gz', 'example.08')
})

test_that('Example 09: WSV Data File', {
  test_dataframe('example_09.wsv', 'example.09')
})


test_that('Example 10: WSV Data File with BZip2 Compression', {
  test_dataframe('example_10.wsv.bz2', 'example.10')
})


test_that('Example 11: WSV Data File with Zip Compression', {
  test_dataframe('example_11.wsv.zip', 'example.11')
})


test_that('Example 12: WSV Data File with GZip Compression', {
  test_dataframe('example_12.wsv.gz', 'example.12')
})


test_that('Example 13: RData Data File with .RData Extension', {
  test_dataframe('example_13.RData', 'm')
})


test_that('Example 14: RData Data File with .rda Extension', {
  test_dataframe('example_14.rda', 'n')
})


test_that('Example 15: URL File with .url Extension', {
  skip("NYI")
})


test_that('Example 16: TSV File with .tab Extension', {
  test_dataframe('example_16.tab', 'example.16')
})


test_that('Example 17: TSV File with .tab Extension and BZip2 Compression', {
  test_dataframe('example_17.tab.bz2', 'example.17')
})


test_that('Example 18: TSV File with .tab Extension and Zip Compression', {
  test_dataframe('example_18.tab.zip', 'example.18')
})


test_that('Example 19: TSV File with .tab Extension and GZip Compression', {
  test_dataframe('example_19.tab.gz', 'example.19')
})


test_that('Example 20: WSV File with .txt Extension', {
  test_dataframe('example_20.txt', 'example.20')
})


test_that('Example 21: WSV File with .txt Extension and BZip2 Compression', {
  test_dataframe('example_21.txt.bz2', 'example.21')
})


test_that('Example 22: WSV File with .txt Extension and Zip Compression', {
  test_dataframe('example_22.txt.zip', 'example.22')
})


test_that('Example 23: WSV File with .txt Extension and GZip Compression', {
  test_dataframe('example_23.txt.gz', 'example.23')
})


test_that('Example 24: R File with .R Extension', {
  test_dataframe('example_24.R', 'example.24')
})


test_that('Example 25: R File with .r Extension', {
  test_dataframe('example_25.r', 'example.25')
})


test_that('Example 26: Excel 2007 File with .xls Extension', {
  test_dataframe('example_26.xls', 'Sheet1')
})


test_that('Example 27: Excel 2011 File with .xlsx Extension', {
  skip("NYI")
  test_dataframe('example_27.xlsx', 'Sheet1')
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

  test_dataframe_file('example_28.sql', 'example.28')
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

  test_dataframe_file('example_29.sql', 'SELECT.N..Prime.FROM.example.29.ORDER.BY.Prime')
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

  test_dataframe_file('example_30.sql', c('example.30a', 'example.30b'))
})


test_that('Example 31: SQLite3 Support with .db Extension', {
  test_dataframe('example_31.db', c('example.31a', 'example.31b'))
})


test_that('Example 32: Weka Support with .arff Extension', {
  test_dataframe('example_32.arff', 'example.32')
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
  test_dataframe_file('example_33.file', 'example.33')
})


test_that('Example 34: MP3 Support with .mp3 Extension', {
  skip("NYI")
})


test_that('Example 35: PPM Support with .ppm Extension', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_35.ppm')

  variable.name <- "variable"
  expect_warning(
    variable <- reader(filename)[[1]],
    " is NULL so the result will be NULL")

  expect_that(exists(variable.name), is_true())
  expect_that(as.character(class(get(variable.name))), equals('pixmapRGB'))
  skip("#13")
})


test_that('Example 36: dBase Support with .dbf Extension', {
  test_dataframe('example_36.dbf', 'example.36')
})


test_that('Example 37: SPSS Support with .sav Extension', {
  skip("#13")
  test_dataframe('example_37.sav', 'example.37',
                 expected_warning = "Unrecognized record type 7, subtype 18 encountered in system file")
})


test_that('Example 38: SPSS Support with .sav Extension / Alternative Generation', {
  skip("#13")
  test_dataframe('example_38.sav', 'example.38',
                 expected_warning = "Unrecognized record type 7, subtype 18 encountered in system file")
})


test_that('Example 39: Stata Support with .dta Extension', {
  test_dataframe('example_39.dta', 'example.39')
})


test_that('Example 40: Stata Support with .dta Extension / Alternative Generation', {
  test_dataframe('example_40.dta', 'example.40')
})


test_that('Example 41: SAS Support with .xport Extension', {
  skip("#13")
  test_dataframe('example_41.xport', 'example.41')
})


test_that('Example 42: SAS Support with .xpt Extension', {
  skip("#13")
  test_dataframe('example_42.xpt', 'example.42')
})


test_that('Example 43: ElasticSearch Support with .es Extension', {
  skip("NYI")
})
