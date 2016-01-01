#nfl data app

#packages----
library(shiny)
library(shinyapps)

#install.packages("devtools")
#install_github( repo = "shinyapps", username="rstudio" )

source("nfl_team_stats.R")

#UI----

# begin each app with template:
#ui <- fluidPage()
#server <- function(input, output){}
#shinyApp(ui = ui, server = server)

# add elements as arguments to fluidPage()
# create reactive inputs with an Input() function
# display reactive results with an Output() function


ui <- fluidPage(
  # Give the page a title
  titlePanel("NFL Team Stats"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("team", "Team:", 
                  choices=levels(stats$team))
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("downs.plot")  
    )
    
  )
)


#Server----
#server function assembles inputs into outputs

#3 rules:
# save output you build to output$
# build output objects with render function
# access  inout values with input$ to build rendered outputs

server <- function(input, output){
  output$downs.plot <- renderPlot(
    
    # Render a barplot
    barplot(x = stats$year, y= stats$firstdowns.game[input == "2015"],
            main="First Downs",
            ylab="Number of Telephones",
            xlab="Year")
  )
}


#Shiny App----
shinyApp(ui = ui, server = server)
