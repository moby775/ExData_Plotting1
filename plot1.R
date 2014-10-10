
install.packages("sqldf")
library(sqldf)
setwd("C:/Users/Zhi Rong/Desktop/Datascience/Exploratory Data Analysis/Course Project 1")
fileName="household_power_consumption.txt"

d <- read.csv.sql(fileName, sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')", sep = ";", header = TRUE)
data=as.data.frame(d)

data$Date<-as.Date(data$Date)
data$Time<-strptime(data$Time, "%H:%M:%S")
xname ="Global Active Power"
xlabel = "Global Active Power (kilowatts)"
hist(data$Global_active_power, col = "red",main = paste(xname),xlab = xlabel)
