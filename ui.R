library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(theme = shinytheme("paper"),
        "Who Police Killed and Where in 2015",
         tags$h3("In 2015..."),
         tags$p("Police killed 467 Americans. Some came from opulent backgrounds,
others from places historically under the poverty line. Some were students, parents, or employees. Some were young, old, or somewhere
                  in between. Some were armed and some were not. 
                    
                 What each of them will not be is forgotten. Using data from the statistical website fivethirtyeight that merged the Guardian's data on police killings
                 in 2015 with Census data, each victim will not be just a point. Each victim will
                 be a part of a bigger puzzle, to try to find clarity and make sense of the devastating killings that have occured. By exploring and representation facets of the victim's 
                 background and the demographics surrounding the location of the killing, we hope that
                 the relationships between these factors will reveal themselves."),
                   # Create a tab panel for your map
                   tabPanel(
                     "Bubble Map",
                     # Create sidebar layout
                     sidebarLayout(
                       
                       # Side panel for controls
                       sidebarPanel(
                         tags$h5("All Police Killings in 2015"),
                         tags$h6("Hover for more details about each specific killing."),
                         # Input to select variable to map
                         selectInput(
                           "map_var",
                           label = "Variable to Color Each Point",
                           choices = list(
                             "Race/Ethnicity" = "raceethnicity",
                             "Gender" = "gender",
                             "Cause of Death" = "cause"
                           )
                         )
                       ),
                       
                       # Main panel: display plotly map
                       mainPanel(
                         leafletOutput("Map"),
                                   tags$p("This map shows each killing at the hands of police in 2015. The selected
                                         variable will affect the color of each point representing each killing with the
                                         legend provided to the left.")
                       )
                     )
                   ),
                   tabPanel("Another page",
                     h1("filler page")
                      )
                   
                   
                     ))