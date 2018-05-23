library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)
library(stringr)



Sys.setlocale(category = "LC_ALL", locale = "C")

killings_data <- read.csv("police_killings.csv", stringsAsFactors = F)

killings_data$raceethnicity <- factor(killings_data$raceethnicity,
                                      levels = c("Black", "White", "Hispanic/Latino",
                                      "Asian/Pacific Islander"), labels = c("red", "blue", "green", "black"))
                   
killings_data$gender <- factor(killings_data$gender,
                    levels = c("Male", "Female"),
                    labels = c("red", "blue"))

killings_data$cause <- factor(killings_data$cause,
                              levels = c("Gunshot", "Taser", "Death in custody", "Struck by vehicle"),
                              labels = c("red", "blue", "green", "black"))


build_map <- function(df) {
  
  g <- list(
    scope = "usa",
    projection = list(type = "albers usa"),
    showland = TRUE,
    landcolor = toRGB("gray85"),
    subunitwidth = 1,
    countrywidth = 1,
    subunitcolor = toRGB("white"),
    countrycolor = toRGB("white")
  )

  p <- plot_geo(df, locationmode = "USA-states") %>%
    add_markers(
      x = df$longitude, y = df$latitude,
      color = ~I(df$raceethnicity),
      text = paste0(df$name, "
                    ", df$city, ", ",df$state, "
                    ", df$month, " ", df$day),
        marker = list(
        size = 5,
        mode = "markers"
      )) %>%
    colorbar(title = "hi") %>% 
    layout(title = "Police Killings in 2015", geo = g)
  
  p
}

build_map(killings_data)
