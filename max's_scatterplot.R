library(ggplot2)
library(dplyr)
library(ggExtra)

police_killings <- read.csv("police_killings.csv")


max_plot_1 <- function(df) {
	p <- ggplot(police_killings, aes(as.numeric(county_income), as.numeric(share_white), color = armed)) +
  		geom_point() +
  		xlim(0, max(as.numeric(police_killings$county_income))) +
  		ylim(0, max(as.numeric(police_killings$share_white))) +
  		xlab() +
  		ylab()

  	p <- ggMarginal(p, type = "histogram")

  	return(p)
}


max_plot_2 <- function(df) {

}