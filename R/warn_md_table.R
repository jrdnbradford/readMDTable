#' @title Provide Warnings for Potential Markdown Table Issues
#'
#' @details Provide warnings for markdown tables provided to `read_md_table`
#'
#' @param lines Character vector provided by `source_file`
#'
#' @keywords internal
warn_md_table <- function(lines) {
  # Remove the last line if it's empty
  if (length(lines) > 0 && lines[length(lines)] == "") {
    lines <- lines[-length(lines)]
  }

  # Check if there is a header, separator, and at least one row
  if (length(lines) < 3) {
    warning("# lines < 3")
  }

  # Check if the second line is a valid separator line
  separator_line <- lines[2]
  if (!grepl("^\\|?\\s*-+\\s*(\\|\\s*-+\\s*)*\\|?$", separator_line)) {
    warning("Invalid separator line")
  }

  # Get the number of pipes in the header row
  num_pipes <- length(gregexpr("\\|", lines[1])[[1]])

  # Check if all lines are valid table rows and have the same number of pipes
  for (line in lines) {
    if (!grepl("^\\s*\\|.*\\|\\s*$", line)) {
      warning(paste("Invalid table row:", line))
    }
    if (length(gregexpr("\\|", line)[[1]]) != num_pipes) {
      warning(paste("Row does not have same number of cells as header row:", line))
    }
  }
}
