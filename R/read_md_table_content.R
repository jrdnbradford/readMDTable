#' @title Read the Content of a Markdown Table
#'
#' @details Performs basic parsing of a markdown table and passes it along to 
#'   [readr::read_delim].
#'
#' @inheritParams read_md_table
#' @inheritDotParams readr::read_delim -trim_ws -delim
#'
#' @returns A tibble.
#'
#' @keywords internal
#'
#' @noRd
read_md_table_content <- function(markdown_table, warn = TRUE, ...) {
  markdown_table <- stringr::str_split(markdown_table, "\n")[[1]]

  if (warn) warn_md_table(markdown_table)

  # Remove the header separator line (second line)
  markdown_table <- markdown_table[-2]

  # Remove leading and trailing pipes and trim whitespace
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
