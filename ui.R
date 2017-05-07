#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#

library(shiny)
library(datasets)
library(leaflet)

# Define UI for application that plots a map of seismic earthquakes
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Locations of Earthquakes off Fiji"),
  
  # Sidebar with a slider input for filters on magnitude and depth  
  sidebarLayout(
    sidebarPanel(
        "Adjust the sliders to filter the data set on magnitude or depth of the seismic activity observed. The filters apply to anything less than or equal to the values selected.",
        sliderInput("mag",
                   "Richter Scale Magnitude:",
                   min = 4,
                   max = 6.4,
                   value = 6.4, 
                   step = 0.1),
        sliderInput("depth",
                   "Depth (km)",
                   min = 40,
                   max = 680,
                   value = 680,
                   step = 10
                   ),
        "This is one of the Harvard PRIM-H project data sets. They in turn obtained it from Dr. John Woodhouse, Dept. of Geophysics, Harvard University."
    ),
    
    # Show a plot of the generated map
    mainPanel(
        h1("Rowan Young, May 7, 2017"),
        leafletOutput(outputId = "lmap")
    )
  )
))
