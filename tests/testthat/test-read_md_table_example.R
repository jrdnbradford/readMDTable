test_that("read_md_table_example returns file paths", {
  examples <- read_md_table_example()
  example_paths <- read_md_table_example(examples)
  expect_true(all(file.exists(example_paths)))
})


test_that("read_md_table_example returns 4 example files", {
  examples <- read_md_table_example()
  example_paths <- read_md_table_example(examples)
  expect_length(example_paths, 4)
})


test_that("read_md_table_example handles non-existent file", {
  expect_error(read_md_table_example("non_existent_file.md"))
})
