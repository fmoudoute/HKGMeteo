## server.R

library(shiny)


MegaReport <- read.csv(file = "Data/Mega.csv", header = TRUE) 
MegaReport$CO <- NULL 
MegaReport[1] <- NULL 
MegaReport <- na.omit(MegaReport)



shinyServer(function(input, output) {
  output$result <- renderText({
    paste("Active Pollutant 1", input$Pollutant)
  })
  output$result2 <- renderText({
    paste("Active Pollutant 2", input$Pollutant2)
  })
  output$data <- renderTable({
    head(MegaReport[, c(input$Pollutant, input$Pollutant2), drop = FALSE]
    ) }, rownames = TRUE
  )
  NewSetOfData<- reactive({data.frame({
    MegaReport[, c(input$Pollutant, input$Pollutant2), drop = FALSE]
  }, rownames = TRUE)}
  )
  output$Stat1_Mean <- renderText({
    paste("Mean for ", input$Pollutant, round(mean(MegaReport[, c(input$Pollutant)]), digits = 2))
  })
  output$Stat2_Mean <- renderText({
    paste("Mean for ", input$Pollutant2, round(mean(MegaReport[, c(input$Pollutant2)]), digits = 2))
  })
  output$plot1 <- 
    renderPlot({
      model1 <- lm(MegaReport[, c(input$Pollutant)] ~ MegaReport[, c(input$Pollutant2)], data = MegaReport)
      plot(MegaReport[, c(input$Pollutant)], MegaReport[, c(input$Pollutant2)],
           xlab = input$Pollutant, 
           ylab = input$Pollutant2, bty = "n", pch = 16,
           xlim = c(0, 1000), ylim = c(0, 350), main = paste("Linear regreession of", input$Pollutant," vs. ", input$Pollutant2))
      if(input$Show_Avg_X){abline(v = mean(MegaReport[, c(input$Pollutant)]), col = "Blue", lwd = 2)}
      if(input$Show_Avg_Y){abline(h = mean(MegaReport[, c(input$Pollutant2)]), col = "Blue", lwd = 2)}
      if(input$Show_Linear){abline(model1, col = "red", lwd = 2)}
      
      
    } , height = 400, width = 400)
  output$mymap <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
      setView(lng = 114.155, lat = 22.283468 , zoom = 25) %>%
      addMarkers(lng = 114.155, lat = 22.283468, popup = "Central, Hong Kong") # uncomment following if want to have a pop up %>%
  })
  
})
