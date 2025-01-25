## R CMD check results for 0.3.1

This patch release is due to recent CRAN checks that resulted in a NOTE:
```
checking DESCRIPTION meta-information ... NOTE
  Missing dependency on R >= 4.1.0 because package code uses the pipe
  |> or function shorthand \(...) syntax added in R 4.1.0.
  File(s) using such syntax:
    ‘extract_md_tables.R’ ‘source_file.R’
```

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
