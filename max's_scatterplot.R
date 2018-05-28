library(ggplot2)
library(dplyr)
library(ggExtra)

police_killings <- read.csv("police_killings.csv")

max_plot_1 <- function(df, input_x, input_y, input_color) {
	p <- ggplot(police_killings, aes(as.numeric(input_x), as.numeric(input_y), color = input_color)) +
  		geom_point(na.rm = T) +
  		xlim(0, max(as.numeric(police_killings[[input_x]]), na.rm = T)) +
  		ylim(0, max(as.numeric(police_killings[[input_y]]), na.rm = T)) +
  		xlab(input_x) +
  		ylab(input_y)

  	p <- ggMarginal(p, type = "histogram")

  	return(p)
}


max_plot_2 <- function(df) {
	p <- ggplot()
}

