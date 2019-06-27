# reading the file from working directory
file <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
# Sub-setting the data
data <- subset(file, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
gap <- data$Global_active_power
hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()
