library(shiny)
library(ggplot2)
library(caret)
library(dplyr)
suppressPackageStartupMessages(library(googleVis))




shinyUI(navbarPage("Data Products Assignment",
                   tabPanel("Cool GVis Plot",
                            
                            headerPanel("Cool GVis Plot"),
                            
                            
                            mainPanel(
                              
                              htmlOutput("plotFruit")
                              
                            )
                   ),
                   tabPanel("Predict Fruit Profit",
                            headerPanel("Prediction using poor judgment of model, little data and bad choice of variables."),
                            
                            sidebarPanel(
                              
                              selectInput('fL', 'Fruit Location', as.character(Fruits$Location),selected = TRUE),
                              selectInput('fY', 'Fruit Year', as.numeric(Fruits$Year),selected = TRUE),
                              selectInput('fT', 'Fruit Type', as.character(Fruits$Fruit),selected = TRUE)
                              
                            ),
                            mainPanel(
                              textOutput("predictFruitProfit")
                              
                            )
                   ),
                   tabPanel("Help File",
                            #headerPanel("Help File"),
                            helpText("You can navigate to prediction tab, select input variables to get a prediction of fruit 
                                     profit values. If I were you, I wouldn't start a business based on predictions though. But,
                                     that choice is totally left for you. The googleVis data set and plot is taken as is. It was so
                                      cool, I had to add. Despite, my attempts at using different data sets, this google vis plot was failing,
                                     therefore, I stuck with the example provided in the document. The linear model used for prediction is more 
                                     for learning how to use inputs more than anything else. "
                              )
                   )
                  
                   
))
