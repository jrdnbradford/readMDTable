#' @title Get Markdown Table as Characters
#'
#' @details Get markdown table file as character vectors from `read_md_table`.
#'
#' @inheritParams read_md_table
#'
#' @returns Character vectors of markdown table.
#'
#' @keywords internal
#'
#' @noRd
source_file <- function(file) {
  if (file.exists(file)) {
    markdown_table <- readr::read_file(file)
  } else if (grepl("^((http|ftp)s?|sftp)://", file)) {
    markdown_table <- httr2::request(file) |>
      httr2::req_retry(max_tries = 3) |>
      httr2::req_headers("Accept" = "text/plain") |>
      httr2::req_perform(verbosity = 0) |>
      httr2::resp_body_string()
  } else {
    markdown_table <- file
  }

  markdown_table <- stringr::str_split(markdown_table, "\n")[[1]]

  return(markdown_table)
}
