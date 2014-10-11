install.packages("sqldf")
library(sqldf)

fileName="household_power_consumption.txt"
d <- read.csv.sql(fileName, sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')", sep = ";", header = TRUE)
data=as.data.frame(d)
Date_Time<-as.POSIXct(paste(data$Date, data$Time), format ="%d/%m/%Y %H:%M:%S")
plot_data<-cbind(data,Date_Time)

png("plot4.png",width=480,height=480,units = "px")
par(mfrow = c(2, 2),mar = c(3, 3, 2, 2) + 0.1,oma= c(0,0,0,0))

ylabel1 = "Global Active Power"
plot(plot_data$Date_Time,plot_data$Global_active_power,type = "l",ylab =ylabel1,xlab ="",cex.lab =0.7,cex.axis=0.7,mgp = c(2, 1, 0))

ylabel2 = "Voltage"
xlabel2 = "datetime"
plot(plot_data$Date_Time,plot_data$Voltage,type = "l",ylab =ylabel2,xlab =xlabel2,cex.lab =0.7,cex.axis=0.5,mgp = c(2, 1, 0))

ylabel3 = "Energy sub metering"
with(plot_data,plot(plot_data$Date_Time,plot_data$Sub_metering_1,type = "n",ylab =ylabel3,xlab ="",cex.lab =0.7,cex.axis=0.5,mgp = c(2, 1, 0)))
with(plot_data,points(plot_data$Date_Time,plot_data$Sub_metering_1,type = "l",col = "black"))
with(plot_data,points(plot_data$Date_Time,plot_data$Sub_metering_2,type = "l",col = "red"))
with(plot_data,points(plot_data$Date_Time,plot_data$Sub_metering_3,type = "l",col = "blue"))
legend("topright", lty = 1:1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex = 0.7,bty = "n")

ylabel4 = "Global_reactive_power"
xlabel4 = "datetime"
plot(plot_data$Date_Time,plot_data$Global_reactive_power,type = "l",ylab =ylabel4,xlab =xlabel4,cex.lab =0.7,cex.axis=0.5,mgp = c(2, 1, 0))

dev.off()