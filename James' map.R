library(choroplethrMaps)
library(choroplethr)
library(dplyr)
library(stringr)
library(ggplot2)

make_choropleth <- function(df, race_selected) {
  df$region <- state.name[match(df[["state"]], state.abb)]
    df <- df %>% filter(raceethnicity == race_selected)
    df_mod <- count(df, df$region)
    df_mod <- data.frame("region" = tolower(df_mod$`df$region`), "value" = df_mod$n)
    df_mod <- df_mod[!is.na(df_mod$region), ]
    choro_map <- state_choropleth(df_mod,
                     title = paste0("Police Killings In US (", race_selected, ")"),
                     legend = "number of people", num_colors = 5
    )
    return(choro_map)
}
