library(shiny);library(ggplot2);library(dplyr)
library(choroplethr);library(choroplethrMaps);library(XML);library(stringr)
suppressMessages(library(reshape))
options(scipen = 5)

# data source
data(df_president_ts)

# grab president information from Wikipedia
# build the URL
url <- "http://en.wikipedia.org/wiki/List_of_United_States_presidential_elections_by_Electoral_College_margin"

# read the tables and select the one that has the most rows
tables <- readHTMLTable(url)

# the fifth table is the one we want
election <- tbl_df(tables[[5]])
names(election) <- c("rank","Year","Winner","Electors","Winner_votes",
                     "Loser_votes","normalized_margin_victory",
                     "Percentage")

election <- select(election,-rank,-normalized_margin_victory)

shinyServer (
  function(input, output) {
    output$inputValue <- renderPrint({input$year})
    output$electionPlot <- renderPlot({
      
    # use input year to get the correct column
    dp <- tbl_df(select(df_president_ts,region,contains(input$year)))
    
    # change to names work with StateChroropleth function
    names(dp) <- c("region","value")
    
    # create and draw the choropleth
    choro.p = suppressWarnings(StateChoropleth$new(dp))
    choro.p$title = paste(input$year," Election Results")
    choro.p$ggplot_scale = scale_fill_manual(name="Candidate", 
                                         values=c("blue", "red","green","yellow"), 
                                         drop=FALSE)
    choro.p$render()
    })
  output$table <- renderTable({
    data <- filter(election,Year == input$year)
    data
  })
    
  }
)
