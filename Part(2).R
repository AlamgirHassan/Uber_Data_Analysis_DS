data <- read.csv("C:\\Users\\HP\\Desktop\\Data Science Assignment\\Uber_Data_Analysis_DS\\uber-raw-data-sep14.csv")
data<-data.frame(data)
plot(x = data$Lon,y = data$Lat,xlab = "Longitude",ylab = "Latitude",xlim = c(-74.7736,-72.7163),ylim = c(39.9897,41.3476),main = "Logitude vs Latitude",col="cornflowerblue")


