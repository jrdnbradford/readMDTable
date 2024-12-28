#' @title Match Markdown Tables from Markdown Files
#'
#' @details `match_md_tables` attempts to match all markdown
#'   tables in `file` utilizing a regular expression
#'
#' @param content Sourced raw markdown from `source_file`
#'
#' @returns `NULL` if no markdown table content is found,
#'   else a list of table matches.
#'
#' @keywords internal
#'
#' @noRd
match_md_tables <- function(content) {
  table_pattern <- "\\|(?:([^\r\n|]*)\\|)+\r?\n\\|\\s*(:?-+:?)\\s*(\\|\\s*(:?-+:?)\\s*)*\\|?\r?\n(\\|(?:([^\r\n|]*)\\|)+\r?\n)+"
  table_matches <- gregexpr(table_pattern, content, perl = TRUE)
  tables <- regmatches(content, table_matches)[[1]]
  if (length(tables) == 0) {
    return(NULL)
  }
  return(tables)
}
