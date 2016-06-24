# ui.R
library(shiny)
shinyUI(fluidPage(
   tabsetPanel(
      tabPanel("Predicting NYC Flight Delays",
         fluidRow(
            column(4, 
             h3("Flight Information"), 
             numericInput(inputId = "monthx", 
                          label = tags$div(
                             "Choose a month", tags$br(), 
                             "(1 = January, 2 = February,...)"),
                          value = 1, min=1, max=12, step=1),
             numericInput(inputId = "hourx", 
                          label = tags$div(
                             "Choose an hour", tags$br(), "(5 = 5:00AM, 23 = 11:00PM)"),
                          value = 5, min=5, max=23, step=1),
             sliderInput(inputId = "distancex", 
                         label  = "Select distance between airports (miles)",
                         value = 1000, min=80, max=5000, ticks=FALSE)
      ),
            column(4, h3("Airplane Characteristics"),
               selectInput(inputId = "carrierx", label = "Select airline",
                         choices = c("United Air Lines Inc."	= "UA",
                                     "American Airlines Inc." = "AA",
                                     "JetBlue Airways" = "B6",
                                     "Delta Air Lines Inc." = "DL",
                                     "ExpressJet Airlines Inc."	= "EV",
                                     "US Airways Inc."	= "US",
                                     "Southwest Airlines Co." = "WN",
                                     "Virgin America" = "VX",
                                     "AirTran Airways Corporation" = "FL",
                                     "Alaska Airlines Inc." = "AS",
                                     "Endeavor Air Inc." = "9E",
                                     "Frontier Airlines Inc." = "F9",
                                     "Envoy Air" = "MQ",
                                     "Hawaiian Airlines Inc." = "HA",
                                     "Mesa Airlines Inc." = "YV",
                                     "SkyWest Airlines Inc." = "OO")
                   ),                         
                   sliderInput(inputId = "agex", 
                               label  = "Select airplane age in years",
                               value = 10, min=0, max=60, ticks=FALSE),
                   sliderInput(inputId = "seatsx", 
                               label  = "Select number of seats in airplane",
                               value = 150, min=2, max=450, ticks=FALSE)
            ),
            column(4, h3("Local Conditions"),
                   radioButtons(inputId = "originx", label = "Select NYC origin airport",
                                choices = c("Newark" = "EWR", "Kennedy" = "JFK",
                                            "LaGuardia" = "LGA"), inline = TRUE),               
                   sliderInput(inputId = "tempx", 
                               label  = "Select temperature in degrees F",
                               value = 60, min=10, max=100, ticks=FALSE),
                   sliderInput(inputId = "wind_speedx", 
                               label  = "Select wind speed in MPH",
                               value = 10, min=0, max=45, ticks=FALSE),
                   checkboxInput(inputId = "lowvisibx", 
                                 label = tags$strong("Click if Low Visibility")),
                   checkboxInput(inputId = "hasprecipx", 
                                 label = tags$strong("Click if Precipitation"))
            )
                  
               ),
               fluidRow(
                  column(12, 
                         h3("Prob(departure delay > 15 minutes):  "),
                         h3(textOutput("prob"), inline = TRUE)
                         
                  )
               )),
      tabPanel("Documentation",
               includeHTML("NYCFlightDelayDocumentation.html")),            
      tabPanel("Processing nycflights13 Data Code",
               includeHTML("nycflights13_prep.html")),
      tabPanel("Flight Delay Prediction Algorithm Code ",
               includeHTML("NYCFlightDelayPredictionAlgorithm.html")),
      type="pills"
   )
   
))        
