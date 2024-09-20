
# readMDTable <a href="https://jrdnbradford.github.io/readMDTable/"><img src="man/figures/logo.png" align="right" height="139" alt="readMDTable website" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/jrdnbradford/readMDTable/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jrdnbradford/readMDTable/actions/workflows/R-CMD-check.yaml)
[![CRAN
Checks](https://badges.cranchecks.info/summary/readMDTable.svg?label=CRAN%20Status)](https://cran.r-project.org/web/checks/check_results_readMDTable.html)
[![CRAN
version](https://img.shields.io/cran/v/readMDTable?logo=R&label=CRAN%20Version)](https://CRAN.R-project.org/package=readMDTable)
[![Dev
version](https://img.shields.io/github/r-package/v/jrdnbradford/readMDTable/main?label=Dev%20Version&logo=github&labelColor=3e474f&logoColor=959da5)](https://github.com/jrdnbradford/readMDTable)
[![GitHub
License](https://img.shields.io/github/license/jrdnbradford/readMDTable?logo=GNU&label=License)](https://www.gnu.org/licenses/gpl-3.0)
[![Codecov test
coverage](https://codecov.io/gh/jrdnbradford/readMDTable/graph/badge.svg)](https://app.codecov.io/gh/jrdnbradford/readMDTable)
[![Monthly
Downloads](https://cranlogs.r-pkg.org/badges/readMDTable?color=ff69b4)](https://cran.r-project.org/web/packages/readMDTable/index.html)
[![Total
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/readMDTable?color=ff69b4)](https://cran.r-project.org/web/packages/readMDTable/index.html)
<!-- badges: end -->

readMDTable helps convert raw markdown tables from a string, file, or
URL to tibbles.

Many sites (like GitHub) convert markdown tables into HTML tables,
making both available. See the vignette [Benchmarking
rvest](https://jrdnbradford.github.io/readMDTable/articles/rvest-benchmarks.html)
to help determine if you should use readMDTable or rvest.

## Installation

Install the latest CRAN release with:

``` r
install.packages("readMDTable")
```

Install the development version from GitHub using pak:

``` r
pak::pkg_install("jrdnbradford/readMDTable")
```

or devtools:

``` r
devtools::install_github("jrdnbradford/readMDTable")
```

## Usage

If the have a string, file, or URL whose entire content is just a
markdown *table*, you should use `read_md_table` which will return a
tibble.

If the string, file, or URL is a markdown file that has *other content*
besides just a table or tables, such as headings, paragraphs, etc, you
should use `extract_md_tables` which will parse the file, pass the
tables to `read_md_table`, and return a tibble or list of tibbles.

### From a File

Read in an example markdown table from the package:

``` r
mtcars_file <- read_md_table_example("mtcars.md")

read_md_table(mtcars_file)
#> Rows: 32 Columns: 12
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr  (1): model
#> dbl (11): mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 32 × 12
#>    model         mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>    <chr>       <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 Mazda RX4    21       6  160    110  3.9   2.62  16.5     0     1     4     4
#>  2 Mazda RX4 …  21       6  160    110  3.9   2.88  17.0     0     1     4     4
#>  3 Datsun 710   22.8     4  108     93  3.85  2.32  18.6     1     1     4     1
#>  4 Hornet 4 D…  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1
#>  5 Hornet Spo…  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
#>  6 Valiant      18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
#>  7 Duster 360   14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
#>  8 Merc 240D    24.4     4  147.    62  3.69  3.19  20       1     0     4     2
#>  9 Merc 230     22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2
#> 10 Merc 280     19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4
#> # ℹ 22 more rows
```

Read in an example markdown file that has multiple tables:

``` r
mtcars_file <- read_md_table_example("mtcars-split.md")

extract_md_tables(mtcars_file, show_col_types = FALSE)
#> [[1]]
#> # A tibble: 4 × 12
#>   model          mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <chr>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Mazda RX4     21       6   160   110  3.9   2.62  16.5     0     1     4     4
#> 2 Mazda RX4 W…  21       6   160   110  3.9   2.88  17.0     0     1     4     4
#> 3 Datsun 710    22.8     4   108    93  3.85  2.32  18.6     1     1     4     1
#> 4 Hornet 4 Dr…  21.4     6   258   110  3.08  3.22  19.4     1     0     3     1
#> 
#> [[2]]
#> # A tibble: 4 × 12
#>   model          mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <chr>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Hornet Spor…  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
#> 2 Valiant       18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
#> 3 Duster 360    14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
#> 4 Merc 240D     24.4     4  147.    62  3.69  3.19  20       1     0     4     2
#> 
#> [[3]]
#> # A tibble: 4 × 12
#>   model          mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <chr>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Cadillac Fl…  10.4     8 472     205  2.93  5.25  18.0     0     0     3     4
#> 2 Lincoln Con…  10.4     8 460     215  3     5.42  17.8     0     0     3     4
#> 3 Chrysler Im…  14.7     8 440     230  3.23  5.34  17.4     0     0     3     4
#> 4 Fiat 128      32.4     4  78.7    66  4.08  2.2   19.5     1     1     4     1
#> 
#> [[4]]
#> # A tibble: 6 × 12
#>   model          mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <chr>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 Porsche 914…  26       4 120.     91  4.43  2.14  16.7     0     1     5     2
#> 2 Lotus Europa  30.4     4  95.1   113  3.77  1.51  16.9     1     1     5     2
#> 3 Ford Panter…  15.8     8 351     264  4.22  3.17  14.5     0     1     5     4
#> 4 Ferrari Dino  19.7     6 145     175  3.62  2.77  15.5     0     1     5     6
#> 5 Maserati Bo…  15       8 301     335  3.54  3.57  14.6     0     1     5     8
#> 6 Volvo 142E    21.4     4 121     109  4.11  2.78  18.6     1     1     4     2
```

### From a String

``` r
read_md_table("| len | supp | dose |\n|---|---|---|\n| 4.2 | VC | 0.5 |")
#> Rows: 1 Columns: 3
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr (1): supp
#> dbl (2): len, dose
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 1 × 3
#>     len supp   dose
#>   <dbl> <chr> <dbl>
#> 1   4.2 VC      0.5
```

### From a URL

``` r
read_md_table("https://raw.githubusercontent.com/jrdnbradford/readMDTable/main/inst/extdata/iris.md")
#> Rows: 150 Columns: 5
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr (1): variety
#> dbl (4): sepal.length, sepal.width, petal.length, petal.width
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 150 × 5
#>    sepal.length sepal.width petal.length petal.width variety
#>           <dbl>       <dbl>        <dbl>       <dbl> <chr>  
#>  1          5.1         3.5          1.4         0.2 Setosa 
#>  2          4.9         3            1.4         0.2 Setosa 
#>  3          4.7         3.2          1.3         0.2 Setosa 
#>  4          4.6         3.1          1.5         0.2 Setosa 
#>  5          5           3.6          1.4         0.2 Setosa 
#>  6          5.4         3.9          1.7         0.4 Setosa 
#>  7          4.6         3.4          1.4         0.3 Setosa 
#>  8          5           3.4          1.5         0.2 Setosa 
#>  9          4.4         2.9          1.4         0.2 Setosa 
#> 10          4.9         3.1          1.5         0.1 Setosa 
#> # ℹ 140 more rows
```

``` r
extract_md_tables("https://raw.githubusercontent.com/jrdnbradford/readMDTable/main/inst/extdata/ToothGrowth.md")
#> Rows: 60 Columns: 4
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr (1): supp
#> dbl (3): rownames, len, dose
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 60 × 4
#>    rownames   len supp   dose
#>       <dbl> <dbl> <chr> <dbl>
#>  1        1   4.2 VC      0.5
#>  2        2  11.5 VC      0.5
#>  3        3   7.3 VC      0.5
#>  4        4   5.8 VC      0.5
#>  5        5   6.4 VC      0.5
#>  6        6  10   VC      0.5
#>  7        7  11.2 VC      0.5
#>  8        8  11.2 VC      0.5
#>  9        9   5.2 VC      0.5
#> 10       10   7   VC      0.5
#> # ℹ 50 more rows
```

### Warnings and Messy Data

`read_md_table` will throw warnings if there are potential issues with
the markdown table. In many cases it will still correctly read in the
messy data:

``` r
read_md_table(
"  | Name   | Age |            City        | Date   |
|-------|-----|-------------|------------|
  | Alice |      30 |           | 2021/01/08 |
  | Bob          | 25  | Los Angeles | 2023/07/22      
  | Carol | 27       | Chicago     |      |"
)
#> Warning: ✖ Row 4 of the table does not have the same number of cells as the header row:
#>   | Bob | 25 | Los Angeles | 2023/07/22
#> ℹ Expected: 5 pipes, but found: 4 pipes.
#> Rows: 3 Columns: 4
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr  (2): Name, City
#> dbl  (1): Age
#> date (1): Date
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 3 × 4
#>   Name    Age City        Date      
#>   <chr> <dbl> <chr>       <date>    
#> 1 Alice    30 <NA>        2021-01-08
#> 2 Bob      25 Los Angeles 2023-07-22
#> 3 Carol    27 Chicago     NA
```

`extract_md_tables` may fail to recognize markdown tables with improper
formatting, with the result that it won’t pass on the content to
`read_md_table` and therefore won’t return a tibble for that table.
