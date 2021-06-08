#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simulation Gain twister"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("n",
                   "Nombre de tournois:",
                   min = 0,
                   max = 100000,
                   value = 2000),
       selectInput("bi",
                   "buy in",
                   choices=c(2,5,10,20,50,100),
                   selected=5),
       numericInput("cev",
                    "cev",
                    value=75)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("gain"),
      textOutput("roi"),
       plotOutput("distPlot")
    )
  )
))
