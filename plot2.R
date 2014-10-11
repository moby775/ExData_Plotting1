install.packages("sqldf")
library(sqldf)

fileName="household_power_consumption.txt"
d <- read.csv.sql(fileName, sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007')", sep = ";", header = TRUE)
data=as.data.frame(d)
Date_Time<-as.POSIXct(paste(data$Date, data$Time), format ="%d/%m/%Y %H:%M:%S")
plot_data<-cbind(data,Date_Time)

png("plot2.png",width=480,height=480,units = "px")
ylabel = "Global Active Power (kilowatts)"
plot(plot_data$Date_Time,plot_data$Global_active_power,type = "l",ylab =ylabel,xlab ="")
dev.off()



