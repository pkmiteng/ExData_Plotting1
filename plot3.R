##plot3
## Read data from file:
hpc <- read.csv("~/household_power_consumption.txt", sep=";")
## Subset required data (only two dates):
hpc2 <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
## Convert date and time formats:
hpc3 <- transform(hpc2, Date = as.Date(hpc2$Date, format = "%d/%m/%Y"))
hpc4 <- transform(hpc3, Time = strptime(paste(hpc3$Date, hpc3$Time), 
                                        format = "%Y-%m-%d %H:%M:%S"))
## Define x axis:
wds <- hpc4$Time
## Define y axis:
sm1 <- as.vector(hpc4$Sub_metering_1)
sm2 <- as.vector(hpc4$Sub_metering_2)
sm3 <- as.vector(hpc4$Sub_metering_3)
## Create the plot:
plot(wds, as.numeric(sm1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(wds, as.numeric(sm2), type = "l", col = "red")
lines(wds, as.numeric(sm3), type = "l", col = "blue")
## Add legend:
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Create the png file:
dev.copy(png, file = "plot3.png")
dev.off()
