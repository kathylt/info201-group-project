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
                           label = "Variable to color each point",
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
                   tabPanel("Scatterplot",
                     sidebarLayout(
                      sidebarPanel(
                        tags$h5("Explore the data:"),
                        tags$h6("Create a Scatterplot"),
                        selectInput(
                          "scatter_x_var",
                          label = "County data on the x-axis",
                          choices = list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Victim's Income : County Average" = "comp_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College" = "college"
                            )
                          ),
                        selectInput(
                          "scatter_y_var",
                          label = "County data on the y-axis",
                          choices = list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Victim's Income : County Average" = "comp_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College" = "college"
                            )
                          ),
                        selectInput(
                          "scatter_color_var",
                          label = "Variable to color each point",
                          choices = list(
                            "Armed" = "armed",
                            "Race/Ethnicity" = "raceethnicity",
                            "Gender" = "gender"))
                        ),
                      mainPanel(
                        plotOutput("scatter_1"),
                      tags$p("Create a scatterplot with demographic values of your choice on the x axis and the y axis.
                             Then, view the distribution of the values with the histograms depicted above/underneath.")
                      )
                     )
                    ),
                   tabPanel("Choropleth Map",
                     h5("filler page"),
                     sidebarLayout(
                       sidebarPanel(
                         helpText("Create demographic maps with 
                                  information from the police Killings in US."),
                         selectInput("race",
                                     label = "Choose a race/ethnicity to display",
                                     choices = c("White", "Black", "Hispanic/Latino", "Asian/Pacific Islander"),
                                     selected = 1
                         )
                         ),
                       mainPanel(plotOutput("Map2"))
                   )
                      )
                   
                   
                     ))