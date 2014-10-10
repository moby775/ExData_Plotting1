install.packages("sqldf")
library(sqldf)
setwd("C:/Users/Zhi Rong/Desktop/Datascience/Exploratory Data Analysis/Course Project 1")
fileName="household_power_consumption.txt"

d <- read.csv.sql(fileName, sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')", sep = ";", header = TRUE)
data=as.data.frame(d)
Date_Time<-as.POSIXct(paste(data$Date, data$Time), format ="%d/%m/%Y %H:%M:%S")
plot_data<-cbind(data,Date_Time)

par(mfrow = c(1, 1))
ylabel = "Energy sub metering"
with(plot_data,plot(plot_data$Date_Time,plot_data$Sub_metering_1,type = "n",ylab =ylabel,xlab =""))
with(plot_data,points(plot_data$Date_Time,plot_data$Sub_metering_1,type = "l",col = "black"))
with(plot_data,points(plot_data$Date_Time,plot_data$Sub_metering_2,type = "l",col = "red"))
with(plot_data,points(plot_data$Date_Time,plot_data$Sub_metering_3,type = "l",col = "blue"))
legend("topright", lty = 1:1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex = 0.7)
