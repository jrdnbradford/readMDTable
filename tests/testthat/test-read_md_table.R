test_that("read_md_table can read simple markdown table from file", {
  md_file <- test_path("testmd", "simple.md")
  md <- read_md_table(md_file, show_col_types = FALSE)
  expect_length(md, 1)
  expect_true(inherits(md, "list"))
  expect_named(md, "table_1")
  expect_identical(test_tibble_1, md[["table_1"]])
})


test_that("read_md_table can handle missing values in markdown table from file", {
  md_file <- test_path("testmd", "missing-values.md")
  md <- read_md_table(md_file, show_col_types = FALSE)
  expect_identical(test_tibble_2, md[["table_1"]])
})


test_that("read_md_table can read messy markdown table from file", {
  md_file <- test_path("testmd", "messy.md")
  expect_snapshot(
    md <- read_md_table(md_file, force = TRUE, show_col_types = FALSE)
  )
  expect_identical(test_tibble_2, md[["table_1"]])
})


test_that("read_md_table can read messy markdown table from string", {
  md_string <- "| Name  | Age | City        | Date       |\n|-------|-----|-------------|------------|\n| Alice | 30  | New York    | 2021/01/08 |\n| Bob   | 25  | Los Angeles | 2023/07/22 |\n| Carol | 27  | Chicago     | 2022/11/01 |\n"
  md <- read_md_table(md_string, show_col_types = FALSE)
  expect_identical(test_tibble_1, md[["table_1"]])
})


test_that("read_md_table can read simple markdown table from string without ending newline", {
  md_string <- "| len | supp | dose |\n|---|---|---|\n| 4.2 | VC | 0.5 |"
  md <- read_md_table(md_string, show_col_types = FALSE)
  expect_identical(test_tibble_3, md[["table_1"]])
})


test_that("read_md_table can read a markdown table from URL", {
  mtcars <- "https://raw.githubusercontent.com/jrdnbradford/readMDTable/main/inst/extdata/mtcars.md"
  expected_tibble <- read_md_table(mtcars, show_col_types = FALSE)
  md <- read_md_table(read_md_table_example("mtcars.md"), show_col_types = FALSE)
  expect_identical(expected_tibble, md)
})


test_that("read_md_table handles separator line format of Gutenberg Project's mirror table", {
  # Reverse dependency check for https://github.com/ropensci/gutenbergr
  # https://www.gutenberg.org/MIRRORS.ALL
  md_file <- test_path("testmd", "gutenberg.md")
  expect_snapshot(
    md <- read_md_table(md_file, force = TRUE, show_col_types = FALSE)
  )
  expect_identical(test_tibble_1, md[["table_1"]])
})


test_that("gutenbergr usage pattern works with read_md_table result", {
  # gutenbergr accesses mirrors$result[["table_1"]] then calls nrow() and
  # dplyr::slice() on it — verify the returned tibble supports those operations
  md_file <- test_path("testmd", "gutenberg.md")
  md <- suppressWarnings(read_md_table(md_file, warn = FALSE, force = TRUE, show_col_types = FALSE))
  result <- md[["table_1"]]
  expect_true(nrow(result) >= 3)
  expect_s3_class(dplyr::slice(result, 2:(dplyr::n() - 1)), "tbl_df")
})


test_that("read_md_table handles alignment separators", {
  md_file <- test_path("testmd", "aligned.md")
  md <- read_md_table(md_file, show_col_types = FALSE)
  expect_identical(test_tibble_1, md[["table_1"]])
})


test_that("read_md_table handles file with no tables", {
  md_file <- test_path("testmd", "no-table.md")
  expect_warning(
    expect_warning(
      read_md_table(md_file, force = FALSE, show_col_types = FALSE)
    )
  )
  expect_null(
    read_md_table(md_file, force = FALSE, warn = FALSE, show_col_types = FALSE)
  )
})


test_that("read_md_table returns named list for named list access", {
  md_file <- test_path("testmd", "simple.md")
  md <- read_md_table(md_file, show_col_types = FALSE)
  expect_named(md, "table_1")
  expect_identical(md[[1]], md[["table_1"]])
})
