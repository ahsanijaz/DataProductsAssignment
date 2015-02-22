library(shiny)
library(ggplot2)
library(caret)
library(dplyr)
suppressPackageStartupMessages(library(googleVis))

shinyServer(function(input, output) {
  
  fit<-lm(Profit~ Location + Fruit + Year,data= Fruits)
  
  output$predictFruitProfit <- renderText({
    suppressWarnings(paste("The predicted value of the profit on fruit by a useless linear model with input variables as date, location
          and fruit type using location as", input$fL,", year as", input$fY,", and fruit type as", input$fT, "is",
          predict(fit,newdata= data.frame(Location = as.factor(input$fL) ,Fruit = input$fT,Year =as.numeric(input$fY)))))
  }
  )
  
  output$plotFruit <- renderGvis({
    barley$year <- as.numeric(as.character(barley$year))
    Motion=gvisMotionChart(Fruits,timevar = "Year",idvar = "Fruit")
    
    
  })
  
})
