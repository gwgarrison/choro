library(shiny);library(choroplethr)
data(df_president_ts)
year.list <- names(df_president_ts[-1])

shinyUI(
  pageWithSidebar(
    headerPanel("Choropleth Map for Election Year"),
    sidebarPanel(
      selectInput("year", "Presidential Election Year:",year.list),
      #submitButton('Submit'),
      br()
    ),
    mainPanel(
      br(),
      #output choropleth plot
      plotOutput("electionPlot"),
      br(),
      br(),
      # Create a new row for the table.
      tableOutput(outputId="table")
    )
  )
)