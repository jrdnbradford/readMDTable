#' @title Read the Content of a Markdown Table
#'
#' @details Performs basic parsing of a markdown table and passes it along to
#'   [readr::read_delim].
#'
#' @param markdown_table A character vector of a markdown table.
#' @inheritDotParams readr::read_delim -trim_ws -delim
#'
#' @returns A tibble of data created from `markdown_table`.
#'
#' @keywords internal
#'
#' @noRd
read_md_table_content <- function(markdown_table, ...) {
  markdown_table <- stringr::str_split(markdown_table, "\n")[[1]]
  markdown_table <- markdown_table[-2]
  markdown_table <- stringr::str_replace_all(
    markdown_table,
    "^\\s*\\|\\s*|\\s*\\|\\s*$",
    ""
  )

  markdown_tibble <- readr::read_delim(
    paste(markdown_table, collapse = "\n"),
    delim = "|",
    trim_ws = TRUE,
    ...
  )

  return(markdown_tibble)
}
