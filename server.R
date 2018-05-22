library(dplyr)
df <- read.csv("police_killings.csv", stringsAsFactors = F)

shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$map <- renderPlotly({ 
    return(build_map(df))
  }) 
  
  
})