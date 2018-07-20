#### Course 4 week 1 project

#import data
data <- read.table("H:/Data Science specialization/Course4Week1/household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="NA", dec=".", strip.white=TRUE)

#edit data: make numeric so it can be plotted 
data1<- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Global_reactive_power <- as.numeric(as.character(data1$Global_reactive_power))
data1$Voltage <- as.numeric(as.character(data1$Voltage))
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))
data1$Datetime <-paste(data1$Date, data1$Time)


#create png plot4
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
plot(strptime(data1$Datetime, "%d/%m/%Y %H:%M:%S"), data1$Global_active_power, type="l", xlab="",ylab="Global Active Power(Kilowatts)" )
plot(strptime(data1$Datetime, "%d/%m/%Y %H:%M:%S"), data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(data1$Datetime, "%d/%m/%Y %H:%M:%S"), data1$Sub_metering_2, type = "l", col="red")
lines(strptime(data1$Datetime, "%d/%m/%Y %H:%M:%S"), data1$Sub_metering_3, type = "l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(strptime(data1$Datetime, "%d/%m/%Y %H:%M:%S"), data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(strptime(data1$Datetime, "%d/%m/%Y %H:%M:%S"), data1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()