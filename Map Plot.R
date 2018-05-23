library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)
library(stringr)


Sys.setlocale(category = "LC_ALL", locale = "C")
df <- read.csv("police_killings.csv", stringsAsFactors = F)

build_map_static <- function(df) {
library(leaflet)

df$raceethnicity <- factor(df$raceethnicity, levels = c("Black", "White", "Hispanic/Latino",
                                                        "Asian/Pacific Islander"))
df$gender <- factor(killings_data1$gender,
                    levels = c("Male", "Female"))

df$cause <- factor(killings_data1$cause,
                   levels = c("Gunshot", "Taser", "Death in custody", "Struck by vehicle"))


factpal <- colorFactor(topo.colors(4), df[, map_var])
  map <- leaflet(df) %>% 
    addTiles() %>% 
  addCircleMarkers(radius = 1, label = paste0(df$name,"
",df$city, ", ", df$state,"
", df$month," ", df$day), color = ~factpal(map_var), opacity = .7) %>% 
    addLegend(position = "bottomleft", pal = factpal, values = ~map_var,
              title = str_to_title(map_var), na.label = "Not Collected")
  map
}

build_map(df)
