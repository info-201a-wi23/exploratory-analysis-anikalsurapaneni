# chart 3

install.packages("maps")

library("maps")
library("mapproj")
library("ggplot2")
library("plotly")
library("dplyr")


# Load World Heritage Site data
whc_sites_2021 <- read.csv("~/Documents/Info201code/exploratory-analysis-anikalsurapaneni/whc-sites-2021.csv", stringsAsFactors = FALSE)

# Load country shapefile
country_shape <- map_data("world")
View(country_shape)

# Count number of endangered world heritage sites per country
country_endangerment <- whc_sites_2021 %>%
  group_by('Country.name') %>%
  filter(danger == "1") %>%
  count(Country.name) %>%

country_endangerment

# New dataframe of the counted number of endangered world heritage sites per country
country_endangerment_df <- whc_sites_2021  %>%
  group_by('Country.name') %>%
  filter(danger == "1") %>%
  count(Country.name)

View(country_endangerment_df)

# Join the `country_shape` and `country_endangerment_df` dataframes as country_endangerment_shape_data
country_endangerment_shape_data <- left_join(country_shape, 
                                             country_endangerment_df,
                                             by = c("region" = "Country.name"))

# Choropleth map of number of endangered world heritage sites per country
ggplot(country_endangerment_shape_data) +
  geom_polygon(mapping = aes(x = long, 
                             y = lat, 
                             group = group, 
                             fill = danger)) +
  scale_fill_continuous(low = 'lightblue',
                        high ='blue') +
  coord_map() +
  labs(title = 'Number of Endangered World Heritage Sites per Country', fill = 'Danger')
