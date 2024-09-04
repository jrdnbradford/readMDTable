# read_md_table warns that markdown has invalid separator row

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning in `warn_md_table()`:
      Invalid separator line
    Output
      # A tibble: 2 x 2
        H1    H2   
        <chr> <chr>
      1 R1C1  R1C2 
      2 R2C1  R2C2 

# read_md_table warns that markdown has <3 rows

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning in `warn_md_table()`:
      # lines < 3
    Output
      # A tibble: 0 x 2
      # i 2 variables: H1 <chr>, H2 <chr>

# read_md_table warns that markdown has invalid row

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning in `warn_md_table()`:
      Invalid table row:  R1C1  R1C2 
      Warning in `warn_md_table()`:
      Row does not have same number of cells as header row:  R1C1  R1C2 
      Warning:
      One or more parsing issues, call `problems()` on your data frame for details, e.g.:
        dat <- vroom(...)
        problems(dat)
    Output
      # A tibble: 1 x 2
        H1         H2   
        <chr>      <lgl>
      1 R1C1  R1C2 NA   

# read_md_table warns that markdown row has different # cells than header

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning in `warn_md_table()`:
      Row does not have same number of cells as header row: | R1C1 | R1C2 ||
      Warning:
      One or more parsing issues, call `problems()` on your data frame for details, e.g.:
        dat <- vroom(...)
        problems(dat)
    Output
      # A tibble: 2 x 2
        H1    H2    
        <chr> <chr> 
      1 R1C1  R1C2 |
      2 R2C1  R2C2  

