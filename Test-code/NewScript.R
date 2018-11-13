library(tidyverse)
library(timeSeries)
library(tseries)
gretlData <- read.csv('C:\\Users\\Philip Lund Thomsen\\Documents\\GitHub\\R-programmin\\Test-code\\Data\\brand_cassola.csv')
names(gretlData)

gretlData <- gretlData %>% 
            select(y,rs,infl) %>% 
            na.omit()
ts1 <- ts(gretlData,start = c(1980,2),frequency = 2)

plot.ts(ts1)

var.number.lags <- function(tsX,type='both',nlags=10){
  x<-vars::VARselect(ts1,type = 'both')
  return(x$selection['AIC(n)'[1]])
  
}
y<- vars::VAR(ts1,lag.max = var.number.lags(ts1))
plot(y)


# GARCH model -------------------------------------------------------------
library(rugarch)

timeSeries::MSFT

spec = ugarchspec()
