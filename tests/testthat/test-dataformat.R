context('Dataformat')

test_that('Data format constructor', {
  expect_equal(class(dataformat("a.csv.bz2", check_exists = FALSE)), c("dataformat.csv.bz2", "dataformat.bz2", "dataformat"))
  expect_equal(class(dataformat("a.csv", check_exists = FALSE)), c("dataformat.csv", "dataformat"))
  expect_error(class(dataformat("abc", check_exists = FALSE)), "cannot detect extension")
  expect_error(class(dataformat(c("abc", "def"))), "atomic")
  expect_error(class(dataformat(5)), "character")
  expect_error(class(dataformat("")), "does not exist")
})
