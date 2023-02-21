#Load database
heritage_sites_df <- read.csv("/Users/liannaqiu/Desktop/world_heritage_data.csv", stringsAsFactors = FALSE)

#Load library
library("dplyr")
library("ggplot2")
library("styler")
library("tidyr")

#Calculating number of different sites in danger for each region 
cultural_sites_summary <- heritage_sites_df %>% 
  select(Region, category_long, danger) %>% 
  group_by(Region) %>% 
  filter(danger == "1" & category_long == "Cultural", na.rm = TRUE) %>% 
  count(danger)

natural_sites_summary <- heritage_sites_df %>% 
  select(Region, category_long, danger) %>% 
  group_by(Region) %>% 
  filter(danger == "1" & category_long == "Natural", na.rm = TRUE) %>% 
  count(danger)

mixed_sites_summary <- heritage_sites_df %>% 
  select(Region, category_long, danger) %>% 
  group_by(Region) %>% 
  filter(danger == "1" & category_long == "Mixed", na.rm = TRUE) %>% 
  count(danger)


#Joining all dataset into 1 table
Joined <- left_join(cultural_sites_summary, natural_sites_summary, by = "Region") 

danger_sites_by_region <- left_join(Joined, mixed_sites_summary, by = "Region") %>% 
  rename(cultural = n.x, natural = n.y, mixed = n) %>% 
  replace(is.na(.), 0) %>% 
  select(-c(danger.x, danger.y, danger))


#Gathering all 3 columns into 1 column for plotting 
danger_long <- gather(danger_sites_by_region, key = "site_type", value = "number_of_sites", cultural, natural, mixed)


#Making it into plot

ggplot(danger_long) +
  geom_point(mapping = aes(x = Region, y = number_of_sites, color = site_type)) +
  labs(title = "Number of Types of Sites in Different Regions",
       x = "Regions",
       y = "Number of Sites",
       color = "Type of Site")

