#' @title Extract Markdown Tables from Markdown Files
#'
#' @details `extract_md_tables` attempts to capture all the markdown
#'   tables from `file`. Because it must parse through markdown that
#'   may contain much more than just tables, it requires that the
#'   tables follow the markdown table format much more closely
#'   than `readMDTable::read_md_table`.
#'
#' @inheritParams read_md_table
#'
#' @returns A character vector of markdown tables that can be
#'   processed by `readMDTable::read_md_table`.
#'
#' @examples
#' md <-
#' "# Heading 1
#'
#' We'll split the `mtcars` dataset for testing `extract_md_tables`.
#'
#' ## Heading 2
#'
#' |model              |mpg |cyl|disp |hp |drat|wt   |qsec |vs |am |gear|carb|
#' |-------------------|----|---|-----|---|----|-----|-----|---|---|----|----|
#' |Mazda RX4          |21  |6  |160  |110|3.9 |2.62 |16.46|0  |1  |4   |4   |
#' |Mazda RX4 Wag      |21  |6  |160  |110|3.9 |2.875|17.02|0  |1  |4   |4   |
#' |Datsun 710         |22.8|4  |108  |93 |3.85|2.32 |18.61|1  |1  |4   |1   |
#' |Hornet 4 Drive     |21.4|6  |258  |110|3.08|3.215|19.44|1  |0  |3   |1   |
#'
#' ## Another Heading 2
#' Another paragraph.
#'
#' With some lines.
#'
#' Like this one.
#'
#' |model              |mpg |cyl|disp |hp |drat|wt   |qsec |vs |am |gear|carb|
#' |-------------------|----|---|-----|---|----|-----|-----|---|---|----|----|
#' |Hornet Sportabout  |18.7|8  |360  |175|3.15|3.44 |17.02|0  |0  |3   |2   |
#' |Valiant            |18.1|6  |225  |105|2.76|3.46 |20.22|1  |0  |3   |1   |
#' |Duster 360         |14.3|8  |360  |245|3.21|3.57 |15.84|0  |0  |3   |4   |
#' |Merc 240D          |24.4|4  |146.7|62 |3.69|3.19 |20   |1  |0  |4   |2   |
#'
#' Just some paragraph text here.
#'
#' |model              |mpg |cyl|disp |hp |drat|wt   |qsec |vs |am |gear|carb|
#' |-------------------|----|---|-----|---|----|-----|-----|---|---|----|----|
#' |Cadillac Fleetwood |10.4|8  |472  |205|2.93|5.25 |17.98|0  |0  |3   |4   |
#' |Lincoln Continental|10.4|8  |460  |215|3   |5.424|17.82|0  |0  |3   |4   |
#' |Chrysler Imperial  |14.7|8  |440  |230|3.23|5.345|17.42|0  |0  |3   |4   |
#' |Fiat 128           |32.4|4  |78.7 |66 |4.08|2.2  |19.47|1  |1  |4   |1   |
#'
#' |model              |mpg |cyl|disp |hp |drat|wt   |qsec |vs |am |gear|carb|
#' |-------------------|----|---|-----|---|----|-----|-----|---|---|----|----|
#' |Porsche 914-2      |26  |4  |120.3|91 |4.43|2.14 |16.7 |0  |1  |5   |2   |
#' |Lotus Europa       |30.4|4  |95.1 |113|3.77|1.513|16.9 |1  |1  |5   |2   |
#' |Ford Pantera L     |15.8|8  |351  |264|4.22|3.17 |14.5 |0  |1  |5   |4   |
#' |Ferrari Dino       |19.7|6  |145  |175|3.62|2.77 |15.5 |0  |1  |5   |6   |
#' |Maserati Bora      |15  |8  |301  |335|3.54|3.57 |14.6 |0  |1  |5   |8   |
#' |Volvo 142E         |21.4|4  |121  |109|4.11|2.78 |18.6 |1  |1  |4   |2   |"
#'
#' # Extract tables from the markdown file
#' tables <- extract_md_tables(md)
#'
#' # Read in the 2nd table
#' read_md_table(tables[[2]])
#' @export
extract_md_tables <- function(file) {
  markdown_tables <- source_file(file)
  markdown_tables <- stringr::str_split(markdown_tables, "\n")[[1]]
  markdown_tables <- sapply(markdown_tables, trimws)
  markdown_tables <- paste(markdown_tables, collapse = "\n")

  # See https://stackoverflow.com/questions/9837935/regex-for-markdown-table-syntax
  table_pattern <- "/|(?:([^\r\n|]*)\\|)+\r?\n\\|(?:(:?-+:?)\\|)+\r?\n(\\|(?:([^\r\n|]*)\\|)+\r?\n)+"
  table_matches <- gregexpr(table_pattern, markdown_tables, perl = TRUE)
  tables <- regmatches(markdown_tables, table_matches)[[1]]
  return(tables)
}
