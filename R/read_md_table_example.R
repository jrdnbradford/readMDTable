#' @title Get Path to readMDTable Example
#'
#' @details readMDTable comes bundled with a number of sample files in its `inst/extdata`
#' directory. This function makes them easy to access
#'
#' @param file Name of file. If `NULL`, the example files will be listed.
#'
#' @examples
#' read_md_table_example()
#' read_md_table_example("mtcars.md")
#'
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
