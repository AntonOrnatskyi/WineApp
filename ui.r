library(shiny)

wineData <- read.csv("data/wine.csv", header=FALSE)
names(wineData) <- c("Class", "Alcohol", "MalicAcid", "Ash", "AlcalinityOfAsh",
                     "Magnesium", "TotalPhenols", "Flavanoids", "NonflavanoidPhenols",
                     "Proanthocyanins", "ColorIntensity", "Hue", "OD280_OD315_ofDilutedWines",
                     "Proline")
# Min value, max value, mean/start value
AlcMinMax <- c(min(wineData$Alcohol),max(wineData$Alcohol), mean(wineData$Alcohol))
MAcidMinMax <- c(min(wineData$MalicAcid),max(wineData$MalicAcid), mean(wineData$MalicAcid))
AshMinMax <- c(min(wineData$Ash),max(wineData$Ash), mean(wineData$Ash))
AlcAshMinMax <- c(min(wineData$AlcalinityOfAsh),max(wineData$AlcalinityOfAsh), mean(wineData$AlcalinityOfAsh))

MagMinMax <- c(min(wineData$Magnesium),max(wineData$Magnesium), mean(wineData$Magnesium))
TPhMinMax <- c(min(wineData$TotalPhenols),max(wineData$TotalPhenols), mean(wineData$TotalPhenols))
FlvMinMax <- c(min(wineData$Flavanoids),max(wineData$Flavanoids), mean(wineData$Flavanoids))
NFlvMinMax <- c(min(wineData$NonflavanoidPhenols),max(wineData$NonflavanoidPhenols), mean(wineData$NonflavanoidPhenols))

PrntMinMax <- c(min(wineData$Proanthocyanins),max(wineData$Proanthocyanins), mean(wineData$Proanthocyanins))
ClrMinMax <- c(min(wineData$ColorIntensity),max(wineData$ColorIntensity), mean(wineData$ColorIntensity))
HueMinMax <- c(min(wineData$Hue),max(wineData$Hue), mean(wineData$Hue))
ODMinMax <- c(min(wineData$OD280_OD315_ofDilutedWines),max(wineData$OD280_OD315_ofDilutedWines), mean(wineData$OD280_OD315_ofDilutedWines))
PrlMinMax <- c(min(wineData$Proline),max(wineData$Proline), mean(wineData$Proline))

shinyUI(fluidPage(
  fluidRow(
    column(4,
           img(src = "wine.jpg", width = 212, height = 320, style="display: block; margin-left: auto; margin-right: auto;" )),
    column(4,
           h1("Wine classifier",align="center"),
           br(),
           p("This application determines class of wine using random forest model based on \"Wine recognition database\""),
           br(),
           em("Enter measured parameters of wine with sliders and press \"Predict Class\" button."),
           br(),
           br(),
           verbatimTextOutput("predictedClass"),
           div(actionButton("calcStart","Predict Class")),
           tags$style(type='text/css', "#calcStart{ display: block; margin-left: auto; margin-right: auto; }")
           ),
    column(4,
           img(src = "wineM.jpg", width = 212, height = 320, style="display: block; margin-left: auto; margin-right: auto;" ))
  ),
  fluidRow(
    column(4,
           sliderInput('proline', 'Proline', 
                       min=PrlMinMax[1], max=PrlMinMax[2], value=PrlMinMax[3], 
                       step=5, round=0),
           br(),
           sliderInput('malicAcid', 'Malic Acid', 
                       min=MAcidMinMax[1], max=MAcidMinMax[2], value=MAcidMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('ash', 'Ash', 
                       min=AshMinMax[1], max=AshMinMax[2], value=AshMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('alcAsh', 'Alcalinity of ash', 
                       min=AlcAshMinMax[1], max=AlcAshMinMax[2], value=AlcAshMinMax[3], 
                       step=0.1, round=-1)
    ),
    column(4,
           sliderInput('magnesuim', 'Magnesium', 
                       min=MagMinMax[1], max=MagMinMax[2], value=MagMinMax[3], 
                       step=2, round=0),
           br(),
           sliderInput('totalPhenol', 'Total Phenols', 
                       min=TPhMinMax[1], max=TPhMinMax[2], value=TPhMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('flavanoids', 'Flavanoids', 
                       min=FlvMinMax[1], max=FlvMinMax[2], value=FlvMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('nfvPhenols', 'Nonflavanoid phenols', 
                       min=NFlvMinMax[1], max=NFlvMinMax[2], value=NFlvMinMax[3], 
                       step=0.01, round=-2)
    ),
    column(4,
           sliderInput('proantho', 'Proanthocyanins', 
                       min=PrntMinMax[1], max=PrntMinMax[2], value=PrntMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('colorIntensity', 'Color intensity', 
                       min=ClrMinMax[1], max=ClrMinMax[2], value=ClrMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('hue', 'Hue', 
                       min=HueMinMax[1], max=HueMinMax[2], value=HueMinMax[3], 
                       step=0.01, round=-2),
           br(),
           sliderInput('OD', 'OD280/OD315 of diluted wines', 
                       min=ODMinMax [1], max=ODMinMax [2], value=ODMinMax [3], 
                       step=0.01, round=-2)
    )
  ),
  fluidRow( column(width=4, offset = 4,
                   sliderInput('alcohol', 'Alcohol', 
                               min=AlcMinMax[1], max=AlcMinMax[2], value=AlcMinMax[3], 
                               step=0.01, round=-2))
          )
  )
)