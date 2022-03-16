# My beautiful meme
![My beautiful meme](https://github.com/marknzl/STATS220/blob/PartA/Assignment1/spicy_meme.png)

## Motivation behind the meme
// todo

## R code for the meme
```r
library(magick)

url <- "https://i.imgflip.com/3edj3m.png"

top <- image_read(url) %>%
  image_crop("249x190")

infosys_text <- image_blank(width=249, height=190, color="#FFFFFF") %>%
  image_annotate(text="Information systems", color="#000000", size=25, font="Impact", gravity="center")



mid <- image_read(url) %>%
  image_crop("249x190+0+200")

cs_text <- image_blank(width=249, height=190, color="#FFFFFF") %>%
  image_annotate(text="Computer Science", color="#000000", size=25, font="Impact", gravity="center")



bottom <- image_read(url) %>%
  image_crop("249x190+0+400")

softeng_text <- image_blank(width=249, height=190, color="#FFFFFF") %>%
  image_annotate(text="sOFtWaRe eNgINeEriNG", color="#000000", size=25, font="Impact", gravity="center")


top_row <- image_append(c(top, infosys_text))
mid_row <- image_append(c(mid, cs_text))
bottom_row <- image_append(c(bottom, softeng_text))


c(top_row, mid_row, bottom_row) %>%
  image_append(stack = TRUE) %>%
  image_write("spicy_meme.png")
```
