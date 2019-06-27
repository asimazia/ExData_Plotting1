file <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data <- subset(file, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datatime <- paste(as.Date(data$Date), data$Time) # I used paste and POSIXct instead of strptime() for my own understanding.
data$datatime <- as.POSIXct(datatime) # Also datatime <- strptime(paste(as.Date(data$Date), data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") can be used
gap <- data$Global_active_power
# To make multiple graph
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(0, 0, 2, 0))
with(data, {
  plot(gap ~ datatime, type = "l", ylab="Global Active Power (kilowatts)", xlab ="")
  plot(Voltage ~ datatime, type = "l", ylab = "Voltage (volt)", xlab = "")
  plot(Sub_metering_1 ~ datatime, type = "l", ylab="Energy sub metering", xlab ="", ylim=c(0,40))
  lines(Sub_metering_2 ~ datatime,type = "l", col='Red', ylim=c(0,40))
  lines(Sub_metering_3 ~ datatime,type = "l",col='Blue', ylim=c(0,40))
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ datatime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")
})
dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()
