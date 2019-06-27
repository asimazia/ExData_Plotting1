file <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data <- subset(file, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
gap <- data$Global_active_power
datatime <- paste(as.Date(data$Date), data$Time) # I used paste and POSIXct instead of strptime() as I find it easier than the other one.
data$datatime <- as.POSIXct(datatime) # Also datatime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") can be used 
# First I skipped giving any description for x-axis but the R gives default label on X so then I used "" to indicate no label for x-axis as I had to replicate the figure as given in assignement description
with(data, plot(gap ~ datatime, type = "l", ylab="Global Active Power (kilowatts)", xlab =""))
dev.copy(png, file="plot2.png", height=480, width=480)  # height and width can be used to set the dimensions.   
dev.off()
