library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)
library(stringr)

library(leaflet)

Sys.setlocale(category = "LC_ALL", locale = "C")
df <- read.csv("police_killings.csv", stringsAsFactors = F)




build_map <- function(df, variable) {
  
  labs <- lapply(seq(nrow(df)), function(i) {
    paste0( '<p>', df[i, "name"], '<p></p>', 
            df[i, "city"], ', ', 
            df[i, "state"],'</p>') 
  })
factpal <- colorFactor(brewer.pal(4, "Dark2"), df[, variable])
  map <- leaflet(df) %>% 
    addTiles() %>% 
  addCircleMarkers(radius = 1, label = lapply(labs, HTML), color = factpal(unique(df[,variable])), opacity = .7) %>% 
    addLegend(position = "bottomleft", pal = factpal, values = ~unique(df[,variable]), title = variable, na.label = "Not Collected")
  map
}
build_map(df, "gender")

