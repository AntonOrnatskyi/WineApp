library(shiny)
library(caret)

wineData <- read.csv("data/wine.csv", header=FALSE)
names(wineData) <- c("Class", "Alcohol", "MalicAcid", "Ash", "AlcalinityOfAsh",
                     "Magnesium", "TotalPhenols", "Flavanoids", "NonflavanoidPhenols",
                     "Proanthocyanins", "ColorIntensity", "Hue", "OD280_OD315_ofDilutedWines",
                     "Proline")
#Load pregenerated model for faster processing
load("data/ModelToPredict.RData")

shinyServer(function(input, output) {
  DataForPrediction <- c()
  resultClass <- predict(ClassRFModel,DataForPrediction)
})