context('Readers')

test_that('Example 01: CSV Data file', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_01.csv')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 02: .csv.bz2', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_02.csv.bz2')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 03: csv.zip data', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_03.csv.zip')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 04: CSV Data File with GZip Compression', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_04.csv.gz')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 01a: CSV2 Data file', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_01.csv2')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 02a: .csv2.bz2', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_02.csv2.bz2')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 03a: csv2.zip data', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_03.csv2.zip')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 04a: CSV2 Data File with GZip Compression', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_04.csv2.gz')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})

test_that('Example 05: TSV Data File', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_05.tsv')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 06: TSV Data File with BZip2 Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_06.tsv.bz2')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 07: TSV Data File with Zip Compression', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_07.tsv.zip')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 08: TSV Data File with GZip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_08.tsv.gz')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})

test_that('Example 09: WSV Data File', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_09.wsv')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
  expect_false(any(is.na(as.matrix(get(variable.name)))))

})


test_that('Example 10: WSV Data File with BZip2 Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_10.wsv.bz2')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 11: WSV Data File with Zip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_11.wsv.zip')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 12: WSV Data File with GZip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_12.wsv.gz')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 13: RData Data File with .RData Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_13.RData')

  variable.name <- LoadMyData:::clean.variable.name('example_13')
  res <- reader(filename)

  expect_equal(names(res), 'm')
  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

})


test_that('Example 14: RData Data File with .rda Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_14.rda')

  variable.name <- LoadMyData:::clean.variable.name('example_14')
  res <- reader(filename)

  expect_equal(names(res), 'n')
  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

})


test_that('Example 15: URL File with .url Extension', {

})


test_that('Example 16: TSV File with .tab Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_16.tab')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 17: TSV File with .tab Extension and BZip2 Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_17.tab.bz2')
  variable.name <- LoadMyData:::clean.variable.name('example_17')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 18: TSV File with .tab Extension and Zip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_18.tab.zip')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 19: TSV File with .tab Extension and GZip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_19.tab.gz')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 20: WSV File with .txt Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_20.txt')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 21: WSV File with .txt Extension and BZip2 Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_21.txt.bz2')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 22: WSV File with .txt Extension and Zip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_22.txt.zip')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 23: WSV File with .txt Extension and GZip Compression', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_23.txt.gz')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 24: R File with .R Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_24.R')

  variable.name <- LoadMyData:::clean.variable.name('example_24')
  res <- reader(filename)

  expect_equal(names(res), variable.name)
  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

})


test_that('Example 25: R File with .r Extension', {


  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_25.r')

  variable.name <- LoadMyData:::clean.variable.name('example_25')
  res <- reader(filename)

  expect_equal(names(res), variable.name)
  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

})


test_that('Example 26: Excel 2007 File with .xls Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_26.xls')

  variable.name <- LoadMyData:::clean.variable.name('Sheet1')

  res <- reader(filename)
  expect_equal(names(res), variable.name)

  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

})


test_that('Example 27: Excel 2011 File with .xlsx Extension', {

  #data.file <- 'example_27.xlsx'
  #filename <- file.path(system.file('example_data',
  #                                  package = 'LoadMyData'),
  #                      'example_27.xlsx')
  #variable.name <- LoadMyData:::clean.variable.name('example_27')
  #
  #reader(filename, data.file, variable.name)
  #
  #variable.name <- paste(variable.name, '.Sheet1', sep = '')
  #
  #expect_that(exists(variable.name), is_true())
  #expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  #expect_that(nrow(get(variable.name)), equals(5))
  #expect_that(ncol(get(variable.name)), equals(2))
  #expect_that(get(variable.name)[5, 2], equals(11))
  #rm(example.27.Sheet1, inherits = TRUE)

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

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 29: SQLite3 Support with .sql Extension with query = "SELECT * FROM ..."', {

  filename <- 'example_29.sql'
  sql.file <- data.frame(type = 'sqlite',
                         dbname = file.path(system.file('example_data',
                                                        package = 'LoadMyData'),
                                            'example_29.db'),
                         query = 'SELECT * FROM example_29 WHERE Prime = 11')
  write.dcf(sql.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(1))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[1, 2], equals(11))

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

  data.file <- 'example_30.sql'

  variable1.name <- LoadMyData:::clean.variable.name('example_30a')
  variable2.name <- LoadMyData:::clean.variable.name('example_30b')
  res <- reader(filename, data.file, variable.name)

  expect_equal(names(res), c(variable1.name, variable2.name))

  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

  expect_that(names(res[[2]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[2]]), equals(5))
  expect_that(ncol(res[[2]]), equals(2))
  expect_that(res[[2]][5, 2], equals(11))

  })


test_that('Example 31: SQLite3 Support with .db Extension', {

  data.file <- 'example_31.db'
  filename <- file.path(system.file('example_data',
                                  package = 'LoadMyData'),
                        'example_31.db')

  variable1.name <- LoadMyData:::clean.variable.name('example_31a')
  variable2.name <- LoadMyData:::clean.variable.name('example_31b')
  res <- reader(filename)

  expect_equal(names(res), c(variable1.name, variable2.name))

  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

  expect_that(names(res[[2]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[2]]), equals(5))
  expect_that(ncol(res[[2]]), equals(2))
  expect_that(res[[2]][5, 2], equals(11))

})


test_that('Example 32: Weka Support with .arff Extension', {

  filename <- file.path(system.file('example_data',
                                  package = 'LoadMyData'),
                        'example_32.arff')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 33: Arbitary File Support with .file File Pointing to .db File', {

  filename <- 'example_33.file'
  info.file <- data.frame(path = file.path(system.file('example_data',
                                                        package = 'LoadMyData'),
                                            'example_28.db'),
                         extension = 'db')
  write.dcf(info.file, file = filename, width = 1000)
  on.exit(unlink(filename), add = TRUE)

  variable.name <- LoadMyData:::clean.variable.name('example_28')
  res <- reader(filename)

  expect_equal(names(res), variable.name)
  expect_that(names(res[[1]]), equals(c('N', 'Prime')))
  expect_that(nrow(res[[1]]), equals(5))
  expect_that(ncol(res[[1]]), equals(2))
  expect_that(res[[1]][5, 2], equals(11))

})


test_that('Example 34: MP3 Support with .mp3 Extension', {

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

})


test_that('Example 36: dBase Support with .dbf Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_36.dbf')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 37: SPSS Support with .sav Extension', {

  data.file <- 'example_37.sav'
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_37.sav')

  variable.name <- "variable"

  expect_warning(
    variable <- reader(filename)[[1]],
    "Unrecognized record type 7, subtype 18 encountered in system file")

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 38: SPSS Support with .sav Extension / Alternative Generation', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_38.sav')

  variable.name <- "variable"
  expect_warning(
    variable <- reader(filename)[[1]],
    "Unrecognized record type 7, subtype 18 encountered in system file")

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 39: Stata Support with .dta Extension', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_39.dta')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 40: Stata Support with .dta Extension / Alternative Generation', {
  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_40.dta')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'Prime')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))
})


test_that('Example 41: SAS Support with .xport Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_41.xport')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'PRIME')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 42: SAS Support with .xpt Extension', {

  filename <- file.path(system.file('example_data',
                                    package = 'LoadMyData'),
                        'example_42.xpt')

  variable.name <- "variable"
  variable <- reader(filename)[[1]]

  expect_that(exists(variable.name), is_true())
  expect_that(names(get(variable.name)), equals(c('N', 'PRIME')))
  expect_that(nrow(get(variable.name)), equals(5))
  expect_that(ncol(get(variable.name)), equals(2))
  expect_that(get(variable.name)[5, 2], equals(11))

})


test_that('Example 43: ElasticSearch Support with .es Extension', {

})
