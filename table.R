library(dplyr)
library(stringr)

whc_df <- read.csv("whc-sites-2021.csv", stringsAsFactors = FALSE)
View(whc_df)


whc_sub <- whc_df %>%
  select("Name", "date_inscribed", "danger", "category_long") %>%
  arrange(desc(date_inscribed))

View(head(whc_sub, 10))

