test_that("read_md_table_example returns file paths", {
  examples <- read_md_table_example()
  example_paths <- read_md_table_example(examples)
  expect_true(all(file.exists(example_paths)))
})


test_that("read_md_table_example files parse with no warnings", {
  examples <- read_md_table_example()
  example_paths <- read_md_table_example(examples)
  for (example in example_paths) {
    expect_no_warning(extract_md_tables(example, show_col_types = FALSE))
    expect_no_error(extract_md_tables(example, show_col_types = FALSE))
  }
})
