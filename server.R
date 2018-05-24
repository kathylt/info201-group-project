library(dplyr)
library(leaflet)
source("Map Plot.R")

df <- read.csv("police_killings.csv", stringsAsFactors = F)

df$raceethnicity <- factor(df$raceethnicity, levels = c("Black", "White", "Hispanic/Latino",
                                                        "Asian/Pacific Islander"))
df$gender <- factor(df$gender,
                    levels = c("Male", "Female"))

df$cause <- factor(df$cause,
                   levels = c("Gunshot", "Taser", "Death in custody", "Struck by vehicle"))


shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$Map <- renderLeaflet({ 
    return(build_map(df))
  })
})