library(dplyr)
library(stringr)

whc_df <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-anikalsurapaneni/main/finalwhc.csv", stringsAsFactors = FALSE)
View(whc_df)


whc_sub <- whc_df %>%
  select("Name", "date_inscribed", "danger", "category_long") %>%
  arrange(desc(danger))

whc_sub_10 <- whc_sub %>% slice(1:10)

View(whc_sub_10)


