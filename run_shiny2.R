library(shiny)
library(devtools)

#devtools::install_github('rstudio/shinyapps')

library(shinyapps)


runApp("choro")

deployApp("/Volumes/KINGSTON/play/shiny/choro","choro_president")

