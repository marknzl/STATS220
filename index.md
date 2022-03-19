# Introduction ⭐
Ah, I've seen you've made it to my ~~ugly~~ totally sexy GitHub pages site. Welcome :))

### Table of contents 📘: 
1. My beautiful meme
2. Motivation behind the meme
3. R code for the meme
4. Meme sources

## My beautiful meme 📷
Here is the meme I made using the R package [magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html). You can install it youself easily by running `install.packages("magick")` on the Rstudio console.

![My beautiful meme](Assignment1/spicy_meme.png?raw=true)

## Motivation behind the meme 😤
The motivation behind this meme is quite simple. At **The University of Auckland**, there are **three** main degrees that people pursue to get a job in the software industry:
- [Bachelor of Commerce](https://www.auckland.ac.nz/en/study/study-options/find-a-study-option/bachelor-of-commerce-bcom.html) majoring in [Information Systems](https://www.auckland.ac.nz/en/study/study-options/find-a-study-option/information-systems/undergraduate.html)
- [Bachelor of Science](https://www.auckland.ac.nz/en/study/study-options/find-a-study-option/bachelor-of-science-bsc.html) majoring in [Computer Science](https://www.auckland.ac.nz/en/study/study-options/find-a-study-option/computer-science/undergraduate/bsc-compsci-from-2019.html)
- [Bachelor of Engineering (Honours)](https://www.auckland.ac.nz/en/study/study-options/find-a-study-option/bachelor-of-engineering-honours-behons.html) specializing in [Software Engineering](https://www.auckland.ac.nz/en/study/study-options/find-a-study-option/software-engineering/undergraduate.html)

I myself am a CS student, hence why `"Computer Science"` is captioned next to the fancy pooh bear. The `"Software Engineering"` caption is next to the umm, lesser-attractive pooh bear for the following reasons:
- Some SE students like to "look down" on us CS/InfoSys majors
- They spend an extra year (4 years total) compared to us (3 years total), even though we get the same jobs
- Computer Science sounds cooler 😎

**NOTE:** This meme is purely for fun and satirical reasons - no hate on fellow SE students .

## R code for the meme 💻
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

## Meme sources 🔎

The only image source I used to create this meme was this template from [https://i.imgflip.com/3edj3m.png](https://i.imgflip.com/3edj3m.png):

![source](https://i.imgflip.com/3edj3m.png)
