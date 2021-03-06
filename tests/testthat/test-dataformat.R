context('Dataformat')

test_that('Data format constructor', {
  expect_equal(class(dataformat("a.csv.bz2", check_exists = FALSE)),
               c("dataformat.bz2", "dataformat"))
  expect_equal(attr(dataformat("a.csv.bz2", check_exists = FALSE), "file_extension"),
               "bz2")
  expect_equal(class(dataformat("a.csv", check_exists = FALSE)), c("dataformat.csv", "dataformat"))
  expect_equal(class(dataformat("abc", check_exists = FALSE, override_extension = "csv.bz2")),
               c("dataformat.bz2", "dataformat"))
  expect_equal(attr(dataformat("abc", check_exists = FALSE, override_extension = "csv.bz2"), "file_extension"),
               "bz2")
  expect_error(class(dataformat("abc", check_exists = FALSE)), "cannot detect extension")
  expect_error(class(dataformat(c("abc", "def"))), "atomic")
  expect_error(class(dataformat(5)), "character")
  expect_error(class(dataformat("")), "does not exist")
})

test_that('Data format constructor for connections', {
  con <- file("a.csv.bz2")
  expect_equal(class(dataformat(con)),
               c("dataformat.bz2", "dataformat", class(con)))
  expect_equal(attr(dataformat(con), "file_extension"),
               "bz2")
  close(con)

  con <- bzfile("a.csv")
  expect_equal(class(dataformat(con)), c("dataformat.csv", "dataformat", class(con)))
  close(con)

  con <- bzfile("abc")
  expect_equal(class(dataformat(con, override_extension = "bz2")),
               c("dataformat.bz2", "dataformat", class(con)))
  expect_equal(attr(dataformat(con, override_extension = "csv.bz2"), "file_extension"),
               "bz2")
  expect_error(class(dataformat("abc", check_exists = FALSE)), "cannot detect extension")
  close(con)
})

test_that('Checking if is dataformat object', {
  expect_true(is.dataformat(dataformat("a.csv.bz2", check_exists = FALSE)))
  expect_false(is.dataformat("a.csv.bz2"))
  expect_false(is.dataformat(NULL))
})

test_that('Overriding extension', {
  expect_equal(get_extension("csv.bz2", ""), "bz2")
  expect_equal(get_extension(NULL, "a.csv.bz2"), "bz2")
  expect_equal(get_extension(use_extension(), "a.csv.bz2"), "bz2")
  expect_equal(get_extension(parent_extension(), "a.csv.bz2"), "csv")
})

test_that('Object name', {
  expect_equal(get_objname("csv.bz2", "objname.xml"), "objname")
  expect_equal(get_objname(NULL, "a.csv.bz2"), "a.csv")
  expect_equal(get_objname(use_extension(), "a.csv.bz2"), "a.csv")
  expect_equal(get_objname(parent_extension(), "a.csv.bz2"), "a")
})
