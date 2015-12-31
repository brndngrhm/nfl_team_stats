#nfl data app

#packages----
library(shiny)

#UI----
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a Number",
              value = 25, min = 1, max = 100),
  plotOutput("hist")
)

#Server----
server <- function(input, output){}

#Shiny App----
shinyApp(ui = ui, server = server)
