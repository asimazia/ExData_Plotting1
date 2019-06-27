file <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data <- subset(file, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datatime <- paste(as.Date(data$Date), data$Time) # I used paste and POSIXct instead of strptime() as I find it easier than the other one.
data$datatime <- as.POSIXct(datatime) # Also datatime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") can be used
with(data, {plot(Sub_metering_1 ~ datatime, type = "l", ylab="Energy sub metering", xlab ="")
     lines(Sub_metering_2 ~ datatime,col='Red')
     lines(Sub_metering_3 ~ datatime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lwd=2, lty=1,
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()
