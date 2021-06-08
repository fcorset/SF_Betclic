#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("main.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   output$gain <-renderText({
     paste("Le gain théorique moyen avec rakeback est de ",round(gain.theo(as.numeric(input$n),as.numeric(input$cev),as.numeric(input$bi)),1)," euros, dont ",round(as.numeric(input$n)*as.numeric(input$bi)*.07*0.4,2), " € de rakeback" )
   })
   output$roi <- renderText({
     paste("Le ROI théorique avec rakeback est de ",round(roi.theo.w.rb(as.numeric(input$cev)),2), "%")
   })
  output$distPlot <- renderPlot({
    
  
    
    # draw the histogram with the specified number of bins
    curve(roi.theo.w.rb,from=30, to= 120,ylab="ROI avec RB (bleu) et sans (rouge)",xlab="cev",main="ROI en fonction du cev",col="blue")
    curve(roi.theo.wo.rb,from=30, to= 120,main="ROI en fonction du cev avec RB",add=T,col="red")
    
  })
  
})
