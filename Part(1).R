library("readxl")
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
data <- read.csv("C:\\Users\\HP\\Desktop\\Data Science Assignment\\Uber_Data_Analysis_DS\\uber-raw-data-sep14.csv")
data<-data.frame(data)
#Getting date
first_date <- as.POSIXct(data[1,1], format = "%m/%d/%Y %H:%M:%S")
first_date<-format(first_date, format="%m/%d/%Y")
first_date<-as.Date(first_date,"%m/%d/%Y")
options(max.print=1028136)
my_dates<-c(rep(0,nrow(data)))
week_days<-rep(0,nrow(data))
days<-c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
my_dates[1]<-1
day<-strftime(first_date, "%A")
for (i in 1:7)
{
  if(day==days[i])
  {
    week_days[1]<-(i-1)
    break
  }
}
print(week_days[1])
for(i in 2:nrow(data))
{
  
  #Getting second date
  second_date <- as.POSIXct(data[i,1], format = "%m/%d/%Y %H:%M:%S")
  second_date<-format(second_date, format="%m/%d/%Y")
  second_date <- as.Date(second_date,"%m/%d/%Y")
  #Getting difference between two dates
  a <- seq(from = first_date, to = second_date, by = 'day')
  my_dates[i]<-length(a)
  #Getting day with respect to date
  day<-strftime(second_date, "%A")
  #Setting week day such as Monday as 0, Tuesday as 1 etc.
  for (j in 1:7)
  {
    if(day==days[j])
    {
      week_days[i]<-(j-1)
      break
    }
  }
  
  
}




#Adding a new column my_dates in dataframe
data$days<-my_dates
#Adding a new column week_days in dataframe
data$week_days<-week_days





#plotting density graph and histogram for data$week_days
hist(data$week_days, col="cornflowerblue",border="black",prob = TRUE, xlab = "Week Days",main = "Week Days")
lines(density(data$week_days),lwd = 2,col = "dodgerblue4")

#plotting density graph and histogram for data$days
hist(data$days, col="cornflowerblue",border="black",prob = TRUE, xlab = "Days",main = "Days")
lines(density(data$days),lwd = 2,col = "dodgerblue4")


