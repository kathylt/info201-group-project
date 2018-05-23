library(dplyr)


source("Map Plot.R")
df <- read.csv("police_killings.csv", stringsAsFactors = F)

shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$Map <- renderLeaflet({ 
    return(build_map(df, input$map_var))
  }) 
  
})