#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom cli cli_alert_info
#' @importFrom cli cli_alert_warning
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom readr read_delim
#' @importFrom readr read_file
#' @importFrom stringr str_replace_all
#' @importFrom stringr str_split
## usethis namespace: end
NULL

# These are required for tests but not necessary for the package
# But the check-no-suggests workflow fails if they are put under Suggests
# To ensure there is no R-CMD-check note on unused Imports and the
# check-no-suggests workflow passes, we reference the imports here.
# See https://r-pkgs.org/dependencies-in-practice.html
ignore_unused_imports <- function() {
  tibble::tribble
  lubridate::ymd
}
