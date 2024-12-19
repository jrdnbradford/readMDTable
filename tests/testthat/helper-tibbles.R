test_tibble_1 <- tibble::tribble(
  ~Name,   ~Age, ~City,         ~Date,
  "Alice", 30,   "New York",    lubridate::ymd("2021/01/08"),
  "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
  "Carol", 27,   "Chicago",     lubridate::ymd("2022/11/01")
)

test_tibble_2 <- tibble::tribble(
  ~Name,   ~Age, ~City,         ~Date,
  "Alice", 30,   NA,            lubridate::ymd("2021/01/08"),
  "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
  "Carol", 27,   "Chicago",     NA
)
