#' @title Read a Markdown Table into a Tibble
#'
#' @details `read_md_table` reads a markdown table into a tibble from a string,
#'   file, or URL. It uses [`readr::read_delim`] to efficiently read in data.
#'
#'   `read_md_table` expects `file` to be a raw markdown table.  If `file` is a
#'   markdown file that contains more than just a table or tables, the table(s)
#'   should be read in with [`readMDTable::extract_md_tables`] instead.
#'
#'   If `warn` is `TRUE`, `read_md_table` will warn if there are potential
#'   issues with the provided markdown table. Depending on the issue,
#'   `read_md_table` may still correctly read the table.
#'   [`readr::read_delim`] will provide its own
#'   warnings if there are potential issues.
#'
#' @param file Either a path to a file, a connection, or literal data (either
#'   a single string or a raw vector). Files starting with `http://`,
#'   `https://`, `ftp://`, or `ftps://` will be automatically downloaded.
#'
#' @param warn Boolean. Should a warning be raised if `file` does not
#'   appear to be a markdown table? Defaults to `TRUE`.
#'
#' @inheritDotParams readr::read_delim -trim_ws -delim
#'
#' @returns A tibble created from the markdown table.
#'
#' @examples
#' # Read from a file
#' read_md_table(read_md_table_example("mtcars.md"))
#'
#' # Read from a string
#' read_md_table("| H1 | H2 | \n|-----|-----|\n| R1C1 | R1C2 |\n| R2C1 | R2C2 |")
#'
#' \donttest{
#' # Read from a URL
#' read_md_table(
#'   "https://raw.githubusercontent.com/jrdnbradford/readMDTable/main/inst/extdata/iris.md"
#' )
#' }
#'
#' # Get warning for malformed tables
#' read_md_table(
#'   "| Name  | Age | City        | Date       |
#'    |-------|-----|-------------|------------|
#'    | Alice | 30  | New York    | 2021/01/08 |
#'    | Bob   | 25  | Los Angeles | 2023/07/22 |
#'      Carol | 27  | Chicago     | 2022/11/01  "
#' )
#' @export
read_md_table <- function(file, warn = TRUE, ...) {
  content <- source_file(file)
  table <- match_md_tables(content)
  if (is.null(table)) {
    if (warn) {
      cli::cli_warn(
        c(
          "x" = "Content in provided `file` does not match the readMDTable regex",
          "i" = "Attempting to read in content anyway"
        )
      )
    }
    return(read_md_table_content(content, ...))
  }
  return(read_md_table_content(table, ...))
}
