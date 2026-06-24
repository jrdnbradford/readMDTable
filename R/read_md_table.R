#' @title Read Markdown Tables into Tibbles
#'
#' @details `read_md_table` reads all markdown tables from a string, file, or
#'   URL and returns them as a named list of tibbles. It uses
#'   [`readr::read_delim`] to efficiently read in data.
#'
#'   If `warn` is `TRUE`, `read_md_table` will warn if no markdown tables are
#'   detected in the content. When `force` is also `TRUE`, it will attempt to
#'   read the content as a table anyway. [`readr::read_delim`] will provide its
#'   own warnings if there are potential issues with a table.
#'
#' @param file Either a path to a file, a connection, or literal data (either
#'   a single string or a raw vector). Files starting with `http://`,
#'   `https://`, `ftp://`, or `ftps://` will be automatically downloaded.
#'
#' @param warn Boolean. Should warnings be raised if `file` does not
#'   appear to contain a markdown table? Defaults to `TRUE`.
#'
#' @param force Boolean. Should `read_md_table` attempt to read in content
#'   that does not fit the regex? This param should be used carefully as it
#'   may cause `read_md_table` to return unexpected data. Defaults to `FALSE`.
#'
#' @inheritDotParams readr::read_delim -trim_ws -delim
#'
#' @returns A named list of tibbles (names `"table_1"`, `"table_2"`, …), or
#'   `NULL` if no tables are found and `force` is `FALSE`.
#'
#' @examples
#' # Read a single table from a file
#' read_md_table(read_md_table_example("mtcars.md"))
#'
#' # Read multiple tables from a file
#' read_md_table(read_md_table_example("mtcars-split.md"), show_col_types = FALSE)
#'
#' # Read from a string
#' read_md_table(
#'   "| H1 | H2 | \n|-----|-----|\n| R1C1 | R1C2 |\n| R2C1 | R2C2 |",
#'   warn = FALSE,
#'   force = TRUE
#' )
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
#'      Carol | 27  | Chicago     | 2022/11/01  ",
#'   force = TRUE
#' )
#' @export
read_md_table <- function(file, warn = TRUE, force = FALSE, ...) {
  content <- source_file(file)

  if (force) {
    # force=TRUE: check raw content only. If raw fails, parse it directly
    # without regex so all rows are captured as leniently as possible.
    tables <- match_md_tables(content)
  } else {
    # Normal path: trim each line first so that mixed-markdown documents with
    # leading-whitespace table headers are handled correctly.
    trimmed <- stringr::str_split(content, "\n")[[1]] |>
      sapply(trimws) |>
      paste(collapse = "\n")
    tables <- match_md_tables(trimmed)
  }

  if (is.null(tables)) {
    if (warn) {
      cli::cli_warn(
        c(
          "x" = paste("Content in provided `file` does",
                      "not match the readMDTable regex."),
          "i" = paste("File an issue at",
                      "https://github.com/jrdnbradford/readMDTable/issues",
                      "if this warning is in error.")
        )
      )
    }
    if (force) {
      if (warn) {
        cli::cli_warn(
          c(
            "i" = paste("Attempting to read in content that",
                        "does not match the readMDTable regex.")
          )
        )
      }
      return(list(table_1 = read_md_table_content(content, ...)))
    } else {
      if (warn) {
        cli::cli_warn(
          c(
            "i" = paste("Cannot read content.",
                        "Set `force = TRUE` to attempt reading anyway.",
                        "This may return unexpected results.")
          )
        )
      }
      return(NULL)
    }
  }

  safe_read_md_table_content <- purrr::safely(
    read_md_table_content,
    quiet = TRUE
  )

  table_tibbles <- purrr::map(tables, function(table) {
    safe_read_md_table_content(table, ...)$result
  })

  names(table_tibbles) <- paste0("table_", seq_along(table_tibbles))
  return(table_tibbles)
}

#' @rdname read_md_table
#' @export
extract_md_tables <- function(file, warn = TRUE, force = FALSE, ...) {
  lifecycle::deprecate_warn(
    "0.4.0",
    "extract_md_tables()",
    "read_md_table()",
    details = "Use `read_md_table()`, which reads all tables found in `file` and returns them as a named list of tibbles."
  )
  read_md_table(file, warn = warn, force = force, ...)
}

#' @rdname read_md_table
#' @export
extract_md_table <- function(file, warn = TRUE, force = FALSE, ...) {
  lifecycle::deprecate_warn(
    "0.4.0",
    "extract_md_table()",
    "read_md_table()",
    details = "Use `read_md_table()`, which reads all tables found in `file` and returns them as a named list of tibbles."
  )
  read_md_table(file, warn = warn, force = force, ...)
}
