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
    cat("Button Pressed")
    Alcohol <- c(input$alcohol)
    MalicAcid <- c(input$malicAcid)
    Ash <- c(input$ash)
    AlcalinityOfAsh <- c(input$alcAsh)
    Magnesium <- c(input$magnesuim)
    TotalPhenols <- c(input$totalPhenol)
    Flavanoids <- c(input$flavanoids)
    NonflavanoidPhenols <- c(input$nfvPhenols)
    Proanthocyanins <- c(input$pproantho)
    ColorIntensity <- c(input$colorIntensity)
    Hue <- c(input$hue)
    OD280_OD315_ofDilutedWines <- c(input$OD)
    Proline <- c(input$proline)
    
    cat("Inputs ready")
    
    DataForPrediction <- data.frame(Alcohol, MalicAcid, Ash, AlcalinityOfAsh,
                                    Magnesium, TotalPhenols, Flavanoids, 
                                    NonflavanoidPhenols, Proanthocyanins,
                                    ColorIntensity, Hue, 
                                    OD280_OD315_ofDilutedWines, Proline)
    names(DataForPrediction) <- c("Alcohol", "MalicAcid", "Ash", "AlcalinityOfAsh",
                                  "Magnesium", "TotalPhenols", "Flavanoids", "NonflavanoidPhenols",
                                  "Proanthocyanins", "ColorIntensity", "Hue", "OD280_OD315_ofDilutedWines",
                                  "Proline")
    cat ("Data Frame ready")
    prClass <- predict(ClassRFModel,DataForPrediction)
    output$predictedClass <- renderText (paste("Predicted Class is:", prClass))
})