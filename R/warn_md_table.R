#' @title Provide Warnings for Potential Markdown Table Issues
#'
#' @details Provide warnings for markdown tables provided to `read_md_table`.
#'
#' @param lines Character vector provided by `source_file`.
#'
#' @returns `NULL`, invisibly
#'
#' @keywords internal
#'
#' @noRd
warn_md_table <- function(lines) {
  # Remove the last line if it's empty
  if (length(lines) > 0 && lines[length(lines)] == "") {
    lines <- lines[-length(lines)]
  }

  # Check if there is a header, separator, and at least one row
  if (length(lines) < 3) {
    cli::cli_alert_warning("There {?is/are} only {length(lines)} line{?s}.")
    cli::cli_alert_info("Generally markdown tables should have <=3 rows.")
  }

  # Check if the second line is a valid separator line
  separator_line <- lines[2]
  if (!grepl("^\\|?\\s*-+\\s*(\\|\\s*-+\\s*)*\\|?$", separator_line)) {
    cli::cli_alert_warning("Invalid separator line:\n{separator_line}")
  }

  # Get the number of pipes in the header row
  num_pipes <- length(gregexpr("\\|", lines[1])[[1]])

  # Check if all lines are valid table rows and have the same number of pipes
  pipe_counts <- sapply(lines, function(line) length(gregexpr("\\|", line)[[1]]))

  # Identify lines that do not have the same number of pipes as the header row
  invalid_lines <- lines[pipe_counts != num_pipes]

  if (length(invalid_lines) > 0) {
    sapply(invalid_lines, function(line) {
      cli::cli_alert_warning(
        "Row does not have same number of cells as header row: {line}",
        wrap = TRUE
      )
    })
  }

  invisible(NULL)
}
