test_that("read_md_table_example with no args lists files", {
  expect_length(read_md_table_example(), 3)
})


test_that("read_md_table_example returns a file path", {
  mtcars <- read_md_table_example("mtcars.md")
  expect_no_error(read_md_table(mtcars, show_col_types = FALSE))
})
