#' @title Get Path to readMDTable Examples
#'
#' @details readMDTable comes bundled with a number of sample files
#' in `inst/extdata` directory. This function makes them easy to access.
#'
#' @param file Name of file. If `NULL`, the example files will be listed.
#'
#' @returns Vector of example file names if `file` is `NULL`, else the path
#' to the example markdown table file.
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
#' @references This function and setup follows [`readr::readr_example`].
#'
#' @export
read_md_table_example <- function(file = NULL) {
  if (is.null(file)) {
    dir(system.file("extdata", package = "readMDTable"))
  } else {
    system.file("extdata", file, package = "readMDTable", mustWork = TRUE)
  }
}
