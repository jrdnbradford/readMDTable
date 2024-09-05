#' @title Read a Markdown Table into a Tibble
#'
#' @details `read_md_table` reads a markdown table into
#'   a tibble from a string, file, or URL. It uses
#'   [`readr::read_delim`] to efficiently read in
#'   data.
#'
#'   `read_md_table` will warn if there are potential
#'   issues with the provided markdown table. Depending
#'   on the issue, `read_md_table` may still correctly
#'   read the table.
#'
#' @param file Either a path to a file, a connection, or
#'   literal data (either a single string or a raw vector).
#'   Files starting with ⁠http://⁠, ⁠https://⁠,
#'   ⁠ftp://⁠, or ⁠ftps://⁠ will be automatically downloaded.
#'
#' @param ... Arguments passed on to [`readr::read_delim`]
#'
#' @return A tibble created from the markdown table
#'
#' @examples
#'   read_md_table("| H1 | H2 | \n|-----|-----|\n| R1C1 | R1C2 |\n| R2C1 | R2C2 |")
#'
#'   read_md_table(read_md_table_example("mtcars.md"))
#'
#' @export
read_md_table <- function(file, ...) {
  markdown_table <- source_file(file)
  warn_md_table(markdown_table)

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
