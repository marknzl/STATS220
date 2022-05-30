library(tidyverse)
library(rvest)
library(lubridate)

urls <- c(
  "https://music.apple.com/us/playlist/top-100-global/pl.d25f5d1181894928af76c85c967f8f31",
  "https://music.apple.com/us/playlist/top-100-usa/pl.606afcbb70264d2eb2b51d8dbcfa6a12",
  "https://music.apple.com/us/playlist/top-100-new-zealand/pl.d8742df90f43402ba5e708eefd6d949a",
  "https://music.apple.com/us/playlist/top-100-australia/pl.18be1cf04dfd4ffb9b6b0453e8fae8f1"
)

apple_data <- map_df(1 : length(urls), function(i) {
  Sys.sleep(2)
  page <- read_html(urls[i])
  
  trackId <- page %>%
    html_elements(".songs-list") %>%
    html_elements("a") %>%
    html_attr("href") %>%
    .[str_detect(., "/song/")] %>%
    str_remove_all("https://music.apple.com/us/song/") %>%
    as.numeric()
  
  track_name <- page %>%
    html_elements(".songs-list-row__song-name") %>%
    html_text2()
  
  track_length <- page %>%
    html_elements(".songs-list-row__length") %>%
    html_text2()
  
  track_url <- page %>%
    html_elements(".songs-list") %>%
    html_elements("a") %>%
    html_attr("href") %>%
    .[str_detect(., "/song/")]
  
  track_popularity_position <- page %>%
    html_elements(".songs-list-row__rank") %>%
    html_text2() %>%
    as.numeric()
  
  track_country <- page %>%
    html_elements(".product-page-header") %>%
    html_elements("h1") %>%
    html_text2() %>% 
    str_remove_all("Top 100: ")
  
  return(tibble(trackId, track_name, track_length, track_url, track_popularity_position, track_country, date_scraped = now()))
})

saveRDS(apple_data, "apple_data.rds")


