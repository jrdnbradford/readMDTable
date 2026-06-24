# Get Path to readMDTable Examples

Get Path to readMDTable Examples

## Usage

``` r
read_md_table_example(file = NULL)
```

## Arguments

- file:

  Name of file. If `NULL`, the example files will be listed.

## Value

Vector of example file names if `file` is `NULL`, else the path to the
example markdown table file.

## Details

readMDTable comes with a number of well-known datasets as example
markdown tables in the `inst/extdata` directory. `read_md_table_example`
will list the file names or return the path of a specified file.

## Examples

``` r
# List the available example files
read_md_table_example()
#> [1] "ToothGrowth.md"  "iris.md"         "mtcars-split.md" "mtcars.md"      

# Get the path to the mtcars example file
read_md_table_example("mtcars.md")
#> [1] "/home/runner/work/_temp/Library/readMDTable/extdata/mtcars.md"

# Read in an example file
mtcars_path <- read_md_table_example("mtcars.md")
read_md_table(mtcars_path)
#> Rows: 32 Columns: 12
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "|"
#> chr  (1): model
#> dbl (11): mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> $table_1
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
#> 
```
