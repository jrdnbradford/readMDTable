#' @title Get Path to readMDTable Examples
#'
#' @details readMDTable comes with a number of well-known datasets as example
#'   markdown tables in the `inst/extdata` directory. `read_md_table_example`
#'   will list the file names or return the path of a specified file.
#'
#' @param file Name of file. If `NULL`, the example files will be listed.
#'
#' @returns Vector of example file names if `file` is `NULL`, else the path
#'   to the example markdown table file.
#'
#' @examples
#' # List the available example files
#' read_md_table_example()
#'
#' # Get the path to the mtcars example file
#' read_md_table_example("mtcars.md")
#'
#' # Read in an example file
#' mtcars_path <- read_md_table_example("mtcars.md")
#' read_md_table(mtcars_path)
#' @export
read_md_table_example <- function(file = NULL) {
  if (is.null(file)) {
    dir(system.file("extdata", package = "readMDTable"))
  } else {
    system.file("extdata", file, package = "readMDTable", mustWork = TRUE)
  }
}
