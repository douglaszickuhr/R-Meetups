library(dplyr)
library(tidytext)
library(janeaustenr)
library(stringr)
library(readr)

original_books <- austen_books() %>%
  group_by(book) %>%
  filter(text != "") %>%
  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]",
                                                 ignore_case = TRUE)))) %>%
  ungroup()

write_csv(original_books,"C:/Users/ST9DZ1/Documents/janeausten.csv")
