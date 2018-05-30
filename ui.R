library(shiny)
library(plotly)
library(leaflet)
library(shinythemes)
shinyUI(navbarPage(
  theme = shinytheme("journal"),
  "Who Police Killed and Where in 2015",
  tabPanel(
    "Introduction",
    tags$h3("In 2015..."),
    tags$p("Police killed 467 Americans. Some from opulent backgrounds,
                 others from places historically under the poverty line.
                 Some were students, parents, or employees. Some were young,
                 old, or somewherein between. Some were armed and some were not. 
                    
                 What each of them will not be is forgotten. Using data from
                 the statistical website fivethirtyeight that merged the
                 Guardian's data on police killings in 2015 with Census data,
                 each victim will not be just a point. Each victim will be a
                 part of a bigger puzzle, to try to find clarity and make sense
                 of the devastating killings that have occured. By exploring
                 and representation facets of the victim's background and the
                 demographics surrounding the location of the killing, we hope
                 that the relationships between these factors will reveal
                 themselves."),
    tags$p("Here is a link to the dataset:"),
    tags$a(
      href =
        " https://github.com/fivethirtyeight/data/tree/master/police-killings",
      "Police Killings in 2015"
    )
  ),
  # Create a tab panel bubble map
  tabPanel(
    "Bubble Map",
    # Create sidebar layout
    sidebarLayout(
      sidebarPanel(
        tags$h3("Map of All Police Killings in 2015"),
        helpText("Hover for more details about
                                  each specific killing."),
        # Input to select variable to map
        selectInput(
          "map_var",
          label = "Variable to color each point",
          choices = list(
            list(
                             "Race/Ethnicity" = "raceethnicity",
                             "Gender" = "gender",
                             "Cause of Death" = "cause"
                           ) = "raceethnicity",
            list(
                             "Race/Ethnicity" = "raceethnicity",
                             "Gender" = "gender",
                             "Cause of Death" = "cause"
                           ) = "gender",
            list(
                             "Race/Ethnicity" = "raceethnicity",
                             "Gender" = "gender",
                             "Cause of Death" = "cause"
                           ) = "cause"
          )
        )
      ),
      mainPanel(
        leafletOutput("Map"),
        tags$p("This map shows each killing at the hands of
                                police in 2015. The selected variable will
                                affect the color of each point representing
                                each killing with the legend provided to the
                                left. The hover information details the name
                                of the victim along with the city and state
                                where the killing occurred.")
      )
    )
  ),

  # tab panel for scatterplot
  tabPanel(
    "Scatterplot",
    sidebarLayout(
      sidebarPanel(
        tags$h3("Explore the data: Create a Scatterplot"),
        helpText("Choose which census data to display on
                                  each axis. The census data pertains to the
                                 county where each killing occured."),
        selectInput(
          "scatter_x_var",
          label = "County data on the x-axis",
          choices = list(
            list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "pop",
            list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "county_income",
            list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "share_white",
            list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "share_black",
            list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "share_hispanic",
            list(
                             "Population" = "pop",
                             "Average Income" = "county_income",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "college"
          )
        ),
        selectInput(
          "scatter_y_var",
          label = "County data on the y-axis",
          choices = list(
            list(
                             "Average Income" = "county_income",
                             "Population" = "pop",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "county_income",
            list(
                             "Average Income" = "county_income",
                             "Population" = "pop",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "pop",
            list(
                             "Average Income" = "county_income",
                             "Population" = "pop",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "share_white",
            list(
                             "Average Income" = "county_income",
                             "Population" = "pop",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "share_black",
            list(
                             "Average Income" = "county_income",
                             "Population" = "pop",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "share_hispanic",
            list(
                             "Average Income" = "county_income",
                             "Population" = "pop",
                             "Percentage of White" = "share_white",
                             "Percentage of Black" = "share_black",
                             "Percentage of Hispanic" = "share_hispanic",
                             "Percentage of College Educated" = "college"
                            ) = "college"
          )
        ),
        selectInput(
          "scatter_color_var",
          label = "Variable to color each point",
          choices = list(
            list(
                            "Armed" = "armed",
                            "Race/Ethnicity" = "raceethnicity",
                            "Gender" = "gender") = "armed",
            list(
                            "Armed" = "armed",
                            "Race/Ethnicity" = "raceethnicity",
                            "Gender" = "gender") = "raceethnicity",
            list(
                            "Armed" = "armed",
                            "Race/Ethnicity" = "raceethnicity",
                            "Gender" = "gender") = "gender"
          )
        )
      ),
      mainPanel(
        plotOutput("scatter_1"),
        tags$p("Above is a scatterplot with the chosen
                              demographic values of the counties of each
                              killing on the x axis and the y axis. View the
                             distribution of the values with the histograms
                             depicted above/underneath.")
      )
    )
  ),

  # tab panel for choropleth map
  tabPanel(
    "Choropleth Map",
    h3("Choropleth Map:
                        Number of Victims per Race/Ethnicity"),
    sidebarLayout(
      sidebarPanel(
        helpText("Create choropleth map that shows the
                                   distribution of victim counts by the
                                  race/ethnicity selected."),
        selectInput("race",
          label = "Choose a race/ethnicity to display",
          choices = c(
            "White", "Black",
            "Hispanic/Latino",
            "Asian/Pacific Islander"
          ),
          selected = 1
        )
      ),
      mainPanel(
        plotOutput("Map2"),
        tags$p("Above is a choropleth map detailing the
                                distribution of victims of the selected
                                race/ethnicity across the country. The
                                darker the shade of blue, the greater the
                                number of victims. In circumstances where there
                                were no victims of that race/ethnicity killed
                                in that state or that information was not
                                available, NA is represented in black.")
      )
    )
  )
))
