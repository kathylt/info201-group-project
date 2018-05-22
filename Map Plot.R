library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)
library(stringr)
killings_data <- read.csv("police_killings.csv", stringsAsFactors = F)

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
      fill = "blue",
      #hovertext = df$name,
        marker = list(
        size = 5,
        mode = "markers"
      )) %>%
    colorbar(title = "hi") %>% 
    layout(title = "Police Killings in 2015", geo = g)
  
  p
}

build_map(killings_data)
