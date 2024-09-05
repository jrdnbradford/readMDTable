
# readMDTable

<!-- badges: start -->

[![R-CMD-check](https://github.com/jrdnbradford/readMDTable/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jrdnbradford/readMDTable/actions/workflows/R-CMD-check.yaml)
[![Dev
status](https://img.shields.io/github/r-package/v/jrdnbradford/readMDTable/main?label=Dev%20Version&style=flat-square&logo=github)](https://github.com/jrdnbradford/readMDTable)
<!-- badges: end -->

readMDTable converts raw markdown tables from a string, file, or URL to
tibbles.

Many sites (like GitHub) convert markdown tables into HTML tables. For
these types of tables you’re probably better off using
[rvest](https://rvest.tidyverse.org/).

## Installation

Install from GitHub:

``` r
devtools::install_github("jrdnbradford/readMDTable")
```

## Docs

Review the [package index
reference](https://jrdnbradford.github.io/readMDTable/reference/index.html)
or use

``` r
?readMDTable
```

for documentation.

## Usage

### From a File

Read in an example markdown table from the package:

``` r
mtcars_file <- read_md_table_example("mtcars.md")
```

The raw markdown table:

``` r
cat(readLines(mtcars_file, 10), sep = "\n")
#> |model              |mpg |cyl|disp |hp |drat|wt   |qsec |vs |am |gear|carb|
#> |-------------------|----|---|-----|---|----|-----|-----|---|---|----|----|
#> |Mazda RX4          |21  |6  |160  |110|3.9 |2.62 |16.46|0  |1  |4   |4   |
#> |Mazda RX4 Wag      |21  |6  |160  |110|3.9 |2.875|17.02|0  |1  |4   |4   |
#> |Datsun 710         |22.8|4  |108  |93 |3.85|2.32 |18.61|1  |1  |4   |1   |
#> |Hornet 4 Drive     |21.4|6  |258  |110|3.08|3.215|19.44|1  |0  |3   |1   |
#> |Hornet Sportabout  |18.7|8  |360  |175|3.15|3.44 |17.02|0  |0  |3   |2   |
#> |Valiant            |18.1|6  |225  |105|2.76|3.46 |20.22|1  |0  |3   |1   |
#> |Duster 360         |14.3|8  |360  |245|3.21|3.57 |15.84|0  |0  |3   |4   |
#> |Merc 240D          |24.4|4  |146.7|62 |3.69|3.19 |20   |1  |0  |4   |2   |
```

After reading it in:

``` r
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

### From a String

``` r
read_md_table("| rownames | len | supp | dose |\n|---|---|---|---|\n| 1 | 4.2 | VC | 0.5 |")
#> Rows: 1 Columns: 4
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr (1): supp
#> dbl (3): rownames, len, dose
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 1 × 4
#>   rownames   len supp   dose
#>      <dbl> <dbl> <chr> <dbl>
#> 1        1   4.2 VC      0.5
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

### Warnings and Messy Data

readMDTable will throw warnings if there are potential issues with the
markdown table. In many cases it will still correctly read in the messy
data:

``` r
read_md_table(
"  | Name   | Age |            City        | Date   |
|-------|-----|-------------|------------|
  | Alice |      30 |           | 2021/01/08 |
  | Bob          | 25  | Los Angeles | 2023/07/22      
  | Carol | 27       | Chicago     |      |"
)
#> Warning in warn_md_table(markdown_table): Invalid table row: | Bob | 25 | Los
#> Angeles | 2023/07/22
#> Warning in warn_md_table(markdown_table): Row does not have same number of
#> cells as header row: | Bob | 25 | Los Angeles | 2023/07/22
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

## License

GPL \>= 3.
