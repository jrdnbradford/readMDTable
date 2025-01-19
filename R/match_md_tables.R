#' @title Match Markdown Tables from Markdown Files
#'
#' @details `match_md_tables` attempts to match all markdown
#'   tables in `content` utilizing a regular expression.
#'
#' @param content A character vector from `readMDTable::source_file`.
#'
#' @returns `NULL` if no markdown table content is found,
#'   else a vector of table matches as characters.
#'
#' @keywords internal
#'
#' @noRd
match_md_tables <- function(content) {
  table_pattern <- paste0(
    "\\|(?:([^\r\n|]*)\\|)+\r?\n",          # Header
    "(\\|\\s*(:?-+:?)\\s*)*\\|?\r?\n",      # Separator
    "(\\|(?:([^\\r\\n|]*)\\|)+(\\r?\\n)?)+" # Data
  )

  table_matches <- gregexpr(table_pattern, content, perl = TRUE)
  tables <- regmatches(content, table_matches)[[1]]

  if (length(tables) == 0) {
    return(NULL)
  }

  return(tables)
}
