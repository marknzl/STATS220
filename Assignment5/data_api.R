library(tidyverse)
library(jsonlite)

apple_data <- readRDS("apple_data.rds")
track_ids <- apple_data$track_id %>%
  unique() %>%
  na.omit()

itunes_data <- map_df(1 : length(track_ids), function(i) {
  Sys.sleep(2)
  song_id <- track_ids[i]
  url <- paste0("https://itunes.apple.com/lookup?id=", song_id)
  response <- fromJSON(url)
})

saveRDS(itunes_data, "itunes_data.rds")