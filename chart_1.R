# chart 1

library("dplyr")
library("stringr")
library("ggplot2")


whs_df <- read.csv("~/Desktop/INFO201/exploratory-analysis-anikalsurapaneni/whc-sites-2021.csv", stringsAsFactors = FALSE)
View(whs_df)

danger_per_date <- whs_df %>% 
  group_by(date_inscribed) %>% 
  summarize(total_danger = sum(danger)) %>% 
  View(danger_per_date)

ggplot( data = danger_per_date) +
  geom_col(aes(x = date_inscribed,
               y = total_danger)) +
  labs(title = "Number of Endangered Sites Based
     on Their Year of Inscription", 
       x = "Date of Inscription", 
       y = "Number of Heritage Sites Endangered")

#Purpose: By comparing the number of heritage sites that are endangered to their original date of inscription, we can see if there is any relationship between the two variables. We were able to test whether or not the date of inscription impacts the endangerment of a heritage site. We are able to identify key years that impact these results, giving us the ability to explore the context behind what may have caused these different numbers of endangerment. 

#Insights: We found that heritage sites inscribed in 1982 have the most sites that are endangered. We also found that heritage sites that were inscribed after 2007 never had more than 1 heritage site considered to be endangered. This trend may be influenced by the heritage sites that were inscribed earlier becoming less relevant and consequently being endangered. It could also be a result of the age of the heritage site. We wondered if the graph may be biased because there could have just been more heritage sites inscribed in the 1980’s, influencing our results. However, the graph below demonstrates that this is not the case. Many of the heritage sites were inscribed from 2000 to 2010 which had fewer sites that were endangered. 



p <- whs_df %>% 
  ggplot (aes(x = date_inscribed)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black")+
  labs(title = "Number of Heritage Sites Inscribed
     Based on Year")

p 







