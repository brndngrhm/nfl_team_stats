#nfl data app

#packages----
library(shiny)
library(shinyapps)

#install.packages("devtools")
#install_github( repo = "shinyapps", username="rstudio" )


# begin each app with template:
#ui <- fluidPage()
#server <- function(input, output){}
#shinyApp(ui = ui, server = server)


#UI----
# add elements as arguments to fluidPage()
# create reactive inputs with an Input() function
# display reactive results with an Output() function


ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a Number", 
              value=25, min=1, max=100),
  plotOutput("hist")
)


#Server----
#server function assembles inputs into outputs
#3 rules:
# save output you build to output$
# build output objects with render function
# access  inout values with input$ to build rendered outputs

server <- function(input, output){
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}


#Shiny App----
shinyApp(ui = ui, server = server)
