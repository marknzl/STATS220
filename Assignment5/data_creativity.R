library(tidyverse)
library(dplyr)
library(magick)

song_data <- readRDS("song_data.rds") %>%
  select(track_name, artworkUrl100) %>%
  distinct(artworkUrl100)

image_read(song_data$artworkUrl100) %>%
  image_join() %>%
  image_animate(fps=1) %>%
  image_write("album_cover_slideshow.gif")
