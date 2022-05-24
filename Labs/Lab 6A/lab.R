library(tidyverse)

get_similarity <- function(phrase1, phrase2) {
  
  words1 <- phrase1 %>% str_squish() %>% str_split(" ") %>% unlist()
  words2 <- phrase2 %>% str_squish() %>% str_split(" ") %>% unlist()
  
  num_same <- intersect(words1, words2) %>% length()
  num_total <- union(words1, words2) %>% length()
  
  num_same / num_total # remember last thing created is returned by default, or use return()
}


headlines_data <- read_csv("https://stat.auckland.ac.nz/~fergusson/stats220/data/covid_headlines.csv") %>%
  slice(200 : 400)

print(headlines_data[76,]$headline)

headline_words1 <- headlines_data[159,]$headline %>%
  str_squish() %>%
  str_split(" ") %>%
  unlist()

print(headline_words1[6])

headline_words2 <- headlines_data[69,]$headline %>%
  str_squish() %>%
  str_split(" ") %>%
  unlist()

print(length(headline_words2))

all_words <- union(headline_words1, headline_words2)
print(length(all_words))

same_words <- intersect(headline_words1, headline_words2)
print(length(same_words))

similarity <- get_similarity(headlines_data[58,]$headline, headlines_data[85,]$headline)
print(round(similarity, 1))

compare_headlines <- tibble(headline1 = headlines_data$headline[1:100], headline2 = headlines_data$headline[101:200]) %>%
  rowwise() %>%
  mutate(similarity_score = get_similarity(headline1, headline2))

print(round(compare_headlines[59,]$similarity_score, 1))
print(round(max(compare_headlines$similarity_score), 1))
print(round(mean(compare_headlines$similarity_score), 1))