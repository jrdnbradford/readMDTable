#' @title Get Markdown Table as Characters
#'
#' @details Get markdown table file as character vectors from `read_md_table`
#'
#' @inheritParams read_md_table
#'
#' @return Character vectors of markdown table
#'
#' @keywords internal
#'
#' @noRd
source_file <- function(file) {
  if (file.exists(file)) {
    markdown_table <- read_file(file)
  } else if (grepl("^((http|ftp)s?|sftp)://", file)) {
    response <- GET(file)
    markdown_table <- content(response, "text")
  } else {
    markdown_table <- file
  }

  markdown_table <- str_split(markdown_table, "\n")[[1]]

  return(markdown_table)
}
