##plot 4
# Read file into memory
# source file must be in working directory or accessible
# this code asume source file is in working directory
data1 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", as.is = 1:2,header = TRUE)
# subset the data for february 1st and 2nd only
data.feb <- data1[data1$Date == "2/2/2007" | data1$Date == "1/2/2007",]
# combine date and time
data.feb$DateTime <- paste(data.feb$Date,data.feb$Time)
# put date and time in the correct format
data.feb$DateTime <- strptime(data.feb$DateTime, format = "%d/%m/%Y %H:%M:%S")
# plot 4
png("plot4.png")
n.col <- 2
n.row <- 2
par(mfrow = c(n.col,n.row))
# plot 4-1
plot(data.feb$DateTime, data.feb$Global_active_power, type ="l", ylab = "Global Active Power {kilowatts}", xlab="")

# plot 4-2
plot(data.feb$DateTime, data.feb$Voltage, type ="l", ylab = "Voltage", xlab="datetime")

# plot 4-3
plot(data.feb$DateTime, data.feb$Sub_metering_1, type ="l", ylab = "Energy Sub Metering", xlab = "")
lines(data.feb$DateTime, data.feb$Sub_metering_2, col="red")
lines(data.feb$DateTime, data.feb$Sub_metering_3, col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))

# plot 4-4
plot(data.feb$DateTime, data.feb$Global_reactive_power, type ="l", ylab = names(data.feb[4]), xlab="datetime")
dev.off()
