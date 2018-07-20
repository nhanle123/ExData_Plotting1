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

#create png plot1
png("plot1.png", width=480, height=480)
hist(data1$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
