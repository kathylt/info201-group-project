library(dplyr)
library(leaflet)
source("Map Plot.R")
source("max's_scatterplot.R")
source("James' map.R")

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
    return(build_map(df, input$map_var))
  })

  output$scatter_1 <- renderPlot({
  	return(max_plot_1(df, input$scatter_x_var, input$scatter_y_var, input$scatter_color_var))
  })
  
  output$Map2 <- renderPlot ({
    return(make_choropleth(df, input$race))
  })
})