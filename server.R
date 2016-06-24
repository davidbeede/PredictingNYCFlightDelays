library(shiny)
library(randomForest)
library(dplyr)

rfpred <- readRDS("data/nycflights13_predrF.rds")
colnamlst <- names(rfpred$forest$ncat)
lenlst <- length(colnamlst)

shinyServer(
   function(input, output) {
      
      output$prob <- renderText({
         
         df <- data.frame(matrix(data=rep(0,lenlst), ncol=lenlst, nrow=1))
         colnames(df) <- colnamlst
         if(input$monthx > 1){
            eval(parse(text=paste0("df$month", input$monthx, " <- 1")))
         }        
         df$lowvisibTRUE <- as.integer(input$lowvisibx)
         df$hasprecipTRUE  <-  as.integer(input$hasprecipx)
         df$age  <-  input$agex 
         df$seats <- input$seatsx
         df$distance <- input$distancex
         df$temp <- input$tempx 
         df$wind_speed <- input$wind_speedx
         if(input$hourx > 5){
            eval(parse(text=paste0("df$hour", input$hourx, " <- 1")))
         }
         if(input$carrierx != "9E"){
            eval(parse(text=paste0("df$carrier", input$carrierx, " <- 1")))
         }
         if(input$originx != "EWR"){
            eval(parse(text=paste0("df$origin", input$originx, " <- 1")))
         }
         df_mat <- as.matrix(df)
         predict(rfpred, newdata = df_mat, type = "prob")[,2]
      })
   }
)