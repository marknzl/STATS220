library(magick)

# REDEMPTION OPPORTUNITY
# In Assignment 3, I lost 3 marks for the following minor reasons:
#   - Left instructions in the report
#   - Didn't use upper-case for SQL command
#   - Didn't create years_since_published using SQL
#     (I used (mutate() for this lol))
#
# So, in order to redeem myself, I have created an animated slideshow GIF
# using techniques across lectures/labs which displays the top 10 songs with
# their respective artist and album cover across the playlists. 
# Even though the code below is quite short, I feel that I achieved my outcome 
# in a very nice and elegant way by making use of a nested for-loop structure.
# Surely I deserve at least 1 extra redemption mark <3 

countries <- c("Global", "USA", "New Zealand", "Australia")
offsets <- c(0, 10, 20, 30)

top_10 <- readRDS("song_data.rds") %>%
  filter(track_popularity_position <= 10, track_country %in% countries)

image_vector <- c()

for (i in 10:1) { # only count from 1 - 10 and add index offsets for each of the playlists
  for (j in 1:length(countries)) {
    offset <- i + offsets[j]
    cover <- image_read(top_10$artworkUrl100[offset]) %>%
      image_scale(200)
    
    title_section <- image_blank(width = 525, 
                                height = 200, 
                                color = "#e0a3f0") %>%
      image_annotate(text = paste("Top", i, "in", top_10$track_country[offset]),
                     color = "#ffffff",
                     size = 35,
                     gravity = "center",
                     location = "+0+-10") %>%
      image_annotate(text = paste(top_10$track_name[offset], "by", top_10$artistName[offset]),
                     color = "#ffffff",
                     size = 20,
                     gravity = "south",
                     location ="+0+50",
                     weight = 700)
    image <- c(title_section, cover) %>%
      image_append()
    
    image_vector <- append(image, image_vector)
  }
}
image_write_gif(image_vector, "slideshow.gif", delay=1)