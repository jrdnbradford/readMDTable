library(gridExtra)
library(grid)
library(magick)
library(hexSticker)
library(tibble)

raw_logo_path <- file.path("data-raw", "stickers", "logo-raw.png")

table_data <- tibble(
  Feature = c("Name", "Title", "License", "GitHub"),
  Description = c("Package name", "Package title", "License type", "Repository Link"),
  Value = c("{readMDTable}", "Read Markdown Tables\ninto Tibbles", "GPL >= 3", "jrdnbradford/readMDTable")
)

table_grob <- tableGrob(table_data, rows = NULL)

png(raw_logo_path, width = 800, height = 600)
grid.newpage()
grid.draw(table_grob)
dev.off()

# See https://github.com/GuangchuangYu/hexSticker/issues/39
transparent_logo <- image_read(raw_logo_path) %>%
  image_fill(color = "transparent", refcolor = "white", fuzz = 4, point = "+1+1") %>%
  image_fill(color = "transparent", refcolor = "white", fuzz = 4, point = "+517+1") %>%
  image_fill(color = "transparent", refcolor = "white", fuzz = 4, point = "+1+599") %>%
  image_fill(color = "transparent", refcolor = "white", fuzz = 4, point = "+517+599")

image_write(image = transparent_logo, path = raw_logo_path)

sticker(
  raw_logo_path,
  package = "{readMDTable}",
  p_size = 18,
  p_y = 1.3,
  p_color = "black",
  s_x = 1,
  s_y = 0.80,
  s_width = 1.65,
  s_height = 100,
  h_fill = "white",
  h_color = "#ff79c6",
  dpi = 300,
  filename = raw_logo_path
)

file.show(raw_logo_path)

usethis::use_logo(raw_logo_path)
