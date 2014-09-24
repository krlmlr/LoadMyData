context('Varnames')

test_that('Cleans variable names', {
  expect_that(clean.variable.name('test_me'), equals('test.me'))
  expect_that(clean.variable.name('test-me'), equals('test.me'))
  expect_that(clean.variable.name('test..me'), equals('test.me'))
  expect_that(clean.variable.name('test me'), equals('test.me'))
  expect_that(clean.variable.name('1990'), equals('X1990'))
})

