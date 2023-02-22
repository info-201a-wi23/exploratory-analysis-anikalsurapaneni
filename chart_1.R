# chart 1

library("dplyr")
library("stringr")
library("ggplot2")


whs_df <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-anikalsurapaneni/main/finalwhc.csv", stringsAsFactors = FALSE)


danger_per_date <- whs_df %>% 
  group_by(date_inscribed) %>% 
  summarize(total_danger = sum(danger))
 

 ggplot(data = danger_per_date) +
  geom_col(aes(x = date_inscribed,
               y = total_danger)) +
  labs(title = "Number of Endangered Sites Based
     on Their Year of Inscription", 
       x = "Date of Inscription", 
       y = "Number of Heritage Sites Endangered")





