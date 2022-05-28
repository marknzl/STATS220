library(tidyverse)
library(dplyr)
library(gganimate)

song_data <- readRDS("song_data.rds")

visualization <- song_data %>%
  drop_na(trackTimeMillis) %>%
  mutate(is_explicit = ifelse(trackExplicitness == "explicit", TRUE, FALSE)) %>%
  mutate(trackTimeSeconds = round(trackTimeMillis / 1000)) %>%
  filter(isStreamable == TRUE) %>%
  ggplot(aes(x = trackTimeSeconds, y = is_explicit, colour = is_explicit)) +
  geom_boxplot() +
  geom_jitter(height = 0.2) +
  theme() +
  scale_colour_manual(values = c("TRUE" = "#f54242", "FALSE" = "#3f28b5")) +
  labs(title = "Track time vs if a track is explict",
       subtitle = "(track time in seconds)",
       caption = "Sourced from Apple Music API",
       x = "Track time (seconds)",
       y = "Is explicit")

visualization +
  transition_states(is_explicit)

visualization