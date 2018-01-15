## ui.R
library(leaflet)
library(shiny)




shinyUI(fluidPage(
  titlePanel("Central Hong Kong - Pollutants Analysis"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Pollutant", "Choose the first pollutant:",
                  list(`Nitrogen` = c("NOX", "NO2"), #change
                       `Ozone` = "O3",
                       `Particulate` = c("RSP", "FSP", "IA"))
      ),
      selectInput("Pollutant2", "Choose the second pollutant:",
                  list(`Nitrogen` = c("NO2", "NOX"), # change
                       `Ozone` = "O3",
                       `Particulate` = c("RSP", "FSP", "IA"))      ),
      br(), 
      br(),
      
      h4("Mean of Selected variables"),
      textOutput("Stat1_Mean"),
      textOutput("Stat2_Mean"),

      br(), 
      br(),
      h4("Chart Options"),
      checkboxInput("Show_Avg_X", "Show/Hide X-Axis Mean", value = FALSE),
      checkboxInput("Show_Avg_Y", "Show/Hide Y-Axis Mean", value = FALSE),
      checkboxInput("Show_Linear", "Show Linear Regreassion", value = FALSE),
      
      
      
      br(), 
      br(),
      h4("Dataset Preview"),
      tableOutput("data")
    ),
    mainPanel(
      fluidRow(splitLayout(cellWidths = c("50%", "50%"), plotOutput("plot1",  width = 300), leafletOutput("mymap", width = 400)))
    )
  )
  
  
  
  
  
))
