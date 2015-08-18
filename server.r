library(shiny)
library(caret)
library(e1071)
library(randomForest)

wineData <- read.csv("data/wine.csv", header=FALSE)
names(wineData) <- c("Class", "Alcohol", "MalicAcid", "Ash", "AlcalinityOfAsh",
                     "Magnesium", "TotalPhenols", "Flavanoids", "NonflavanoidPhenols",
                     "Proanthocyanins", "ColorIntensity", "Hue", "OD280_OD315_ofDilutedWines",
                     "Proline")
#Load pregenerated Random Forest model for faster processing
load("data/ModelToPredict.RData")

shinyServer(function(input, output) {
  output$predictedClass <- renderText({   
  
    input$calcStart
    isolate({
      Alcohol <- c(input$alcohol)
      MalicAcid <- c(input$malicAcid)
      Ash <- c(input$ash)
      AlcalinityOfAsh <- c(input$alcAsh)
      Magnesium <- c(input$magnesuim)
      TotalPhenols <- c(input$totalPhenol)
      Flavanoids <- c(input$flavanoids)
      NonflavanoidPhenols <- c(input$nfvPhenols)
      Proanthocyanins <- c(input$proantho)
      ColorIntensity <- c(input$colorIntensity)
      Hue <- c(input$hue)
      OD280_OD315_ofDilutedWines <- c(input$OD)
      Proline <- c(input$proline)
      DataForPrediction <- data.frame(Alcohol, MalicAcid, Ash, AlcalinityOfAsh, Magnesium, TotalPhenols, Flavanoids, NonflavanoidPhenols, Proanthocyanins, ColorIntensity, Hue, OD280_OD315_ofDilutedWines, Proline)
      names(DataForPrediction) <- c("Alcohol", "MalicAcid", "Ash", "AlcalinityOfAsh",
                                  "Magnesium", "TotalPhenols", "Flavanoids", "NonflavanoidPhenols",
                                  "Proanthocyanins", "ColorIntensity", "Hue", "OD280_OD315_ofDilutedWines",
                                  "Proline")
      prClass <- predict(ClassRFModel,DataForPrediction)
      paste("Predicted wine class is:", prClass)
    })
  })
})