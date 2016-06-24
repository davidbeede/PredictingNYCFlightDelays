# PredictingNYCFlightDelays
Shiny app ui.R and server.R files submitted in fulfillment of JHU Coursera Developing Data Products final course project.
This Shiny app allows users to see how the predicted probabiity of a flight departing New York City being delayed more than 15 minutes 
(the Federal Aviation Administration's definition of a delayed flight) would change depending on various characteristics of the flight, 
the airplane, and whether conditions at the time of the flight. A random forest model was used to predict the probability that a flight 
would be delayed using the data contained in the "nycflights13: Flights that Departed NYC in 2013" package created by Hadley Wickham for 
Rstudio (<https://cran.r-project.org/web/packages/nycflights13/index.html>).  The choice of variables included was informed by the 
information at these websites: 
(<http://www.rita.dot.gov/bts/help/aviation/html/understanding.html> and <http://www.rita.dot.gov/bts/help_with_data/aviation/index.html>).
