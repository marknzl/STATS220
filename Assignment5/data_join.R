library(tidyverse)

apple_data <- readRDS("apple_data.rds")
itunes_data <- readRDS("itunes_data.rds")
song_data <- inner_join(apple_data, itunes_data$results, by = "trackId")

print(paste("Number of rows in `song_data`:", nrow(song_data)))

print("Column names in `song_data`:")
names(song_data)

glimpse(song_data)

saveRDS(song_data, "song_data.rds")