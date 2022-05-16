library(tidyverse)
library(magick)
library(rvest)

url <- "https://nztop40.co.nz/chart/singles?chart=5328"
page <- read_html(url)

images <- page %>%
  html_elements("img") %>%
  html_attr("src")

covers <- images[str_detect(images, "cover")] %>%
  unique() %>%
  str_replace_all("\\.\\.", "https://nztop40.co.nz")

covers %>%
  image_read() %>%
  image_animate(fps = 1)

titles <- page %>%
  html_elements(".title") %>%
  html_text2() %>%
  unique()

covers %>%
  image_read() %>%
  image_annotate(text = titles, gravity = "center") %>%
  image_animate(fps = 1)