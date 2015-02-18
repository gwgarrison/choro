library(shiny)
library(devtools)

#devtools::install_github('rstudio/shinyapps')

library(shinyapps)

# shinyapps::setAccountInfo(name='garrisongw', token='09508252255710192DF88FC5C2221D0D', secret='iaUaovguOjijk78ogYeARMKnS+H/ZbLxp+7T9isD')

if (file.exists("F:/play")){
  setwd("F:/play")
} else {
  setwd("/Volumes/KINGSTON/play/shiny")
}

runApp("bb_salaries", display.mode = "showcase")
runApp("choro", display.mode = "showcase")
runApp("choro")

# deploy Baseball Salary Predictor
if (file.exists("F:/play/baseball")){
  setwd("F:/play/baseball")
} else {
#  setwd("E:/play/baseball")
  setwd("/Volumes/KINGSTON/play/shiny/choro")
}
deployApp("/Volumes/KINGSTON/play/shiny/choro","choro_president")

