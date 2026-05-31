# Changelog

## readMDTable (development version)

- BREAKING CHANGE: `extract_md_tables` now always returns a named list
  of tibbles (names `"table_1"`, `"table_2"`, …) regardless of how many
  tables are found. Previously a single tibble was returned when only
  one table was present.

## readMDTable 0.3.3

CRAN release: 2026-05-31

- Update to {roxygen2} to 8.0.0
- Requires {readr} \>= 2.2.0

## readMDTable 0.3.2

CRAN release: 2025-05-05

- Pre-compute `rvest-benchmarks` benchmark images
  ([\#98](https://github.com/jrdnbradford/readMDTable/issues/98))

## readMDTable 0.3.1

CRAN release: 2025-01-25

- Add dependency on R (\>= 4.1.0)
  ([\#92](https://github.com/jrdnbradford/readMDTable/issues/92))
- Fixed a typo in a `read_md_table` warning message
  ([\#86](https://github.com/jrdnbradford/readMDTable/issues/86))
- Updated documentation for internal and exported functions
  ([\#88](https://github.com/jrdnbradford/readMDTable/issues/88))
- Added alt text for `rvest-benchmarks` violin plots
  ([\#90](https://github.com/jrdnbradford/readMDTable/issues/90))

## readMDTable 0.3.0

CRAN release: 2025-01-07

- BREAKING CHANGE: `force` param added for `read_md_table`
  ([\#74](https://github.com/jrdnbradford/readMDTable/issues/74))
- Fixed a typo in a warning message
  ([\#59](https://github.com/jrdnbradford/readMDTable/issues/59))
- `extract_md_table` alias added for `extract_md_tables`
  ([\#69](https://github.com/jrdnbradford/readMDTable/issues/69))
- Improvements to markdown table matching
  ([\#76](https://github.com/jrdnbradford/readMDTable/issues/76),
  [\#81](https://github.com/jrdnbradford/readMDTable/issues/81))
- Warnings now rely entirely on matching main regex
  ([\#69](https://github.com/jrdnbradford/readMDTable/issues/69))

## readMDTable 0.2.0

CRAN release: 2024-09-25

- Update `extract_md_tables` example
  ([\#46](https://github.com/jrdnbradford/readMDTable/issues/46))
- `@inheritDotParams` for arguments passed on to
  [`readr::read_delim`](https://readr.tidyverse.org/reference/read_delim.html)
  ([\#44](https://github.com/jrdnbradford/readMDTable/issues/44))
- Abstracted the reading of markdown tables into a new internal function
  `read_md_table_content.R`
  ([\#42](https://github.com/jrdnbradford/readMDTable/issues/42))
- Add vignette benchmarking {readMDTable} to {rvest}
  ([\#40](https://github.com/jrdnbradford/readMDTable/issues/40))
- Added `extract_md_tables`, which captures all markdown tables from a
  markdown file
  ([\#36](https://github.com/jrdnbradford/readMDTable/issues/36))
- Update package `description`
  ([\#35](https://github.com/jrdnbradford/readMDTable/issues/35))

## readMDTable 0.1.1

CRAN release: 2024-09-17

- Fixed an issue on Windows where a warning was incorrectly raised on
  valid separator lines
  ([\#28](https://github.com/jrdnbradford/readMDTable/issues/28))
- Move from {httr} to {httr2}
  ([\#26](https://github.com/jrdnbradford/readMDTable/issues/26))
- Added example with warning for `read_md_table`
  ([\#20](https://github.com/jrdnbradford/readMDTable/issues/20))
- Fixed an issue with rendering the PDF manual due to unicode characters

## readMDTable 0.1.0

### Warning Updates

- `read_md_table` now has a `warn` param to make warnings optional
  ([\#15](https://github.com/jrdnbradford/readMDTable/issues/15))
- Checking markdown table validity now uses vectorization
  ([\#12](https://github.com/jrdnbradford/readMDTable/issues/12))
- Warnings now use {cli}
  ([\#12](https://github.com/jrdnbradford/readMDTable/issues/12))
- `warn_md_table` now explicitly returns `NULL` invisibly
  ([\#10](https://github.com/jrdnbradford/readMDTable/issues/10))

### Misc

- Added a logo
  ([\#22](https://github.com/jrdnbradford/readMDTable/issues/22))
- Improvements to function documentation
  ([\#10](https://github.com/jrdnbradford/readMDTable/issues/10))
- Added test coverage with {covr}
  ([\#17](https://github.com/jrdnbradford/readMDTable/issues/17))

## readMDTable 0.0.1

- Initial release.
