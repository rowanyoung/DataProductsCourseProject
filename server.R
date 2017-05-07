#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(leaflet)

# Define server logic required to plot earthquake data
shinyServer(function(input, output) {
   
output$lmap <- renderLeaflet({
    
    quakes <- subset(quakes, mag <= input$mag)
    quakes <- subset(quakes, depth <= input$depth)
    
    quakes %>% leaflet() %>% addTiles() %>% addMarkers()
    
  })
  
})
