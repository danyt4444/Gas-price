---
  title: "Homework 3"
output: html_document
date: '2022-10-22'
---
  

data("gasprice")


## This is a Timeseries that shows the price of gas for a gallon and the Spotprice of gas since January of 1991. 
## This data set is deleivered in a monthly fashion. 


library(fpp)
library(fpp2)

plot(gasprice[,"GasPrice"])


## My guess is that the acf would show that there is trend, I believe that it will also show seasonality.
## This, in my opinion will look like values that go down over time with ocassional season highs. 


acf(gasprice[,"GasPrice"])


## From this we can certainly see that there is a trend when looking at Gasprice. 
## We can see this is a moving Time series. There is also statistical significance. 



temp <- HoltWinters(gasprice[,"GasPrice"])
attributes(temp)
plot(temp)
temp_f <- forecast(temp)
attributes(temp_f)
plot(temp_f$residuals)
hist(temp_f$residuals)
Acf(temp_f$residuals)
accuracy(temp_f)


# We can see that the acf of the residuals show there is no statistical significance. 
# We can also see that ther eis no trend or seasonality. 


