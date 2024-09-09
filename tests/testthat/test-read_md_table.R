test_that("read_md_table can read simple markdown table from file", {
  md_file <- test_path("testmd", "simple.md")
  md <- read_md_table(md_file, show_col_types = FALSE)

  expected_tibble <- tibble::tribble(
    ~Name,   ~Age, ~City,         ~Date,
    "Alice", 30,   "New York",    lubridate::ymd("2021/01/08"),
    "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
    "Carol", 27,   "Chicago",     lubridate::ymd("2022/11/01")
  )

  expect_identical(expected_tibble, md)
})


test_that("read_md_table can handle missing values in markdown table from file", {
  md_file <- test_path("testmd", "missing-values.md")
  md <- read_md_table(md_file, show_col_types = FALSE)

  expected_tibble <- tibble::tribble(
    ~Name,   ~Age, ~City,         ~Date,
    "Alice", 30,   NA,            lubridate::ymd("2021/01/08"),
    "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
    "Carol", 27,   "Chicago",     NA,
  )

  expect_identical(expected_tibble, md)
})


test_that("read_md_table can read messy markdown table from file", {
  md_file <- test_path("testmd", "messy.md")
  md <- read_md_table(md_file, show_col_types = FALSE)

  expected_tibble <- tibble::tribble(
    ~Name,   ~Age, ~City,         ~Date,
    "Alice", 30,   NA,            lubridate::ymd("2021/01/08"),
    "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
    "Carol", 27,   "Chicago",     NA,
  )

  expect_identical(expected_tibble, md)
})


test_that("read_md_table can read messy markdown table from string", {
  md_string <- I("| Name  | Age | City        | Date       |\n|-------|-----|-------------|------------|\n| Alice | 30  | New York    | 2021/01/08 |\n| Bob   | 25  | Los Angeles | 2023/07/22 |\n| Carol | 27  | Chicago     | 2022/11/01 |
")
  md <- read_md_table(md_string, show_col_types = FALSE)

  expected_tibble <- tibble::tribble(
    ~Name,   ~Age, ~City,         ~Date,
    "Alice", 30,   "New York",    lubridate::ymd("2021/01/08"),
    "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
    "Carol", 27,   "Chicago",     lubridate::ymd("2022/11/01")
  )

  expect_identical(expected_tibble, md)
})


test_that("read_md_table warns that markdown has invalid separator row", {
  input_string <- "| H1 | H2 | \n|-1-|-1-|\n| R1C1 | R1C2 |\n| R2C1 | R2C2 |"
  expect_snapshot(read_md_table(input_string, show_col_types = FALSE))
})


test_that("read_md_table warns that markdown has <3 rows", {
  input_string <- "| H1 | H2 | \n|---|---|\n"
  expect_snapshot(read_md_table(input_string, show_col_types = FALSE))
})


test_that("read_md_table warns that markdown has invalid row", {
  input_string <- "| H1 | H2 | \n|---|---|\n R1C1  R1C2 \n"
  expect_snapshot(read_md_table(input_string, show_col_types = FALSE))
})


test_that("read_md_table warns that markdown has invalid rows", {
  input_string <- "| H1 | H2 | \n|---|---|\n R1C1  R1C2 \n R2C1  R2C2"
  expect_snapshot(read_md_table(input_string, show_col_types = FALSE))
})


test_that("read_md_table warns that markdown row has different # cells than header", {
  input_string <- "| H1 | H2 | \n|---|---|\n| R1C1 | R1C2 ||\n| R2C1 | R2C2 |"
  expect_snapshot(read_md_table(input_string, show_col_types = FALSE))
})


test_that("read_md_table does not warn when warn = FALSE", {
  input_string <- "| H1 | H2 | \n|---|---|\n| R1C1 | R1C2 ||\n| R2C1 | R2C2 |"
  expect_snapshot(read_md_table(input_string, warn = FALSE, show_col_types = FALSE))
})
