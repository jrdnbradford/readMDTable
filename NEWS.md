# readMDTable (development version)

* Abstracted the reading of markdown tables into a new internal function `read_md_table_content.R` (#42)
* Add vignette benchmarking {readMDTable} to {rvest} (#40)
* Added `extract_md_tables`, which captures all markdown tables from a markdown file (#36)

# readMDTable 0.1.1

* Fixed an issue on Windows where a warning was incorrectly raised on valid separator lines (#28)
* Move from {httr} to {httr2} (#26)
* Added example with warning for `read_md_table`
* Fixed an issue with rendering the PDF manual due to unicode characters 

# readMDTable 0.1.0

## Warning Updates

* `read_md_table` now has a `warn` param to make warnings optional (#15)
* Checking markdown table validity now uses vectorization (#12)
* Warnings now use {cli} (#12)
* `warn_md_table` now explicitly returns `NULL` invisibly (#10)

## Misc

* Added a logo (#22)
* Improvements to function documentation (#10)
* Added test coverage with {covr} (#17)

# readMDTable 0.0.1

* Initial release.
