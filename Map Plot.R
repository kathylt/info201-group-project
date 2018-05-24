library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)
library(stringr)

library(leaflet)

Sys.setlocale(category = "LC_ALL", locale = "C")
df <- read.csv("police_killings.csv", stringsAsFactors = F)




build_map <- function(df) {
  
  labs <- lapply(seq(nrow(df)), function(i) {
    paste0( '<p>', df[i, "name"], '<p></p>', 
            df[i, "city"], ', ', 
            df[i, "state"],'</p>') 
  })
factpal <- colorFactor(topo.colors(10), df$cause)
  map <- leaflet(df) %>% 
    addTiles() %>% 
  addCircleMarkers(radius = 1, label = lapply(labs, HTML), color = ~factpal(cause), opacity = .7) %>% 
    addLegend(position = "bottomleft", pal = factpal, values = ~cause, na.label = "Not Collected")
  map
}

build_map(df)
