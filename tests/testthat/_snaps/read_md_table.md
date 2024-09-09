# read_md_table warns that markdown has invalid separator row

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning:
      x Invalid separator line:
        |-1-|-1-|
      i Valid separator lines consist only of `|`, `-`, and `:`
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
      Warning:
      x There are only 2 lines.
      i Generally markdown tables should have <=3 rows.
    Output
      # A tibble: 0 x 2
      # i 2 variables: H1 <chr>, H2 <chr>

# read_md_table warns that markdown has invalid row

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning:
      x Row 3 of the table does not have the same number of cells as the header row:
        R1C1 R1C2
      i Expected: 3 pipes, but found: 1 pipes.
      Warning:
      One or more parsing issues, call `problems()` on your data frame for details, e.g.:
        dat <- vroom(...)
        problems(dat)
    Output
      # A tibble: 1 x 2
        H1         H2   
        <chr>      <lgl>
      1 R1C1  R1C2 NA   

# read_md_table warns that markdown has invalid rows

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning:
      x Row 3 of the table does not have the same number of cells as the header row:
        R1C1 R1C2
      i Expected: 3 pipes, but found: 1 pipes.
      Warning:
      x Row 4 of the table does not have the same number of cells as the header row:
        R2C1 R2C2
      i Expected: 3 pipes, but found: 1 pipes.
      Warning:
      One or more parsing issues, call `problems()` on your data frame for details, e.g.:
        dat <- vroom(...)
        problems(dat)
    Output
      # A tibble: 2 x 2
        H1         H2   
        <chr>      <lgl>
      1 R1C1  R1C2 NA   
      2 R2C1  R2C2 NA   

# read_md_table warns that markdown row has different # cells than header

    Code
      read_md_table(input_string, show_col_types = FALSE)
    Condition
      Warning:
      x Row 3 of the table does not have the same number of cells as the header row:
        | R1C1 | R1C2 ||
      i Expected: 3 pipes, but found: 4 pipes.
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

# read_md_table does not warn when warn = FALSE

    Code
      read_md_table(input_string, warn = FALSE, show_col_types = FALSE)
    Condition
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

