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
    cli::cli_warn(
      c(
        "x" = "There {?is/are} only {length(lines)} line{?s}.",
        "i" = "Generally markdown tables should have <=3 rows."
      )
    )
  }

  # Check if the second line is a valid separator line
  separator_line <- lines[2]
  if (!grepl("^\\|?\\s*(:?-+:?)\\s*(\\|\\s*(:?-+:?)\\s*)*\\|?$", separator_line)) {
    cli::cli_warn(
      c(
        "x" = "Invalid separator line:",
        " " = separator_line,
        "i" = "Valid separator lines consist only of `|`, `-`, and `:`"
      )
    )
  }

  # Get the number of pipes in the header row
  num_pipes <- length(gregexpr("\\|", lines[1])[[1]])

  # Check if all lines are valid table rows and have the same number of pipes
  pipe_counts <- sapply(lines, function(line) length(gregexpr("\\|", line)[[1]]))

  # Identify lines that do not have the same number of pipes as the header row
  invalid_lines <- which(pipe_counts != num_pipes)

  if (length(invalid_lines) > 0) {
    sapply(invalid_lines, function(i) {
      cli::cli_warn(
        c(
          "x" = "Row {i} of the table does not have the same number of cells as the header row:",
          " " = lines[i],
          "i" = "Expected: {num_pipes} pipes, but found: {pipe_counts[i]} pipes."
        )
      )
    })
  }

  invisible(NULL)
}
