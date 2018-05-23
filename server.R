library(dplyr)
killings_data <- read.csv("police_killings.csv", stringsAsFactors = F)
killings_data <- read.csv("police_killings.csv", stringsAsFactors = F)

killings_data$raceethnicity <- factor(killings_data$raceethnicity,
                                      levels = c("Black", "White", "Hispanic/Latino",
                                                 "Asian/Pacific Islander"), labels = c("darkred", "midnightblue", "paleturquoise4", "lightsalmon3"))

killings_data$gender <- factor(killings_data$gender,
                               levels = c("Male", "Female"),
                               labels = c("red", "blue"))

killings_data$cause <- factor(killings_data$cause,
                              levels = c("Gunshot", "Taser", "Death in custody", "Struck by vehicle"),
                              labels = c("red", "blue", "green", "black"))

shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$map <- renderPlotly({ 
    return(build_map(killings_data))
  }) 
  
  
})