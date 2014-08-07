##plot1
## Read data from file:
hpc <- read.csv("~/household_power_consumption.txt", sep=";")
## Subset required data (only two dates):
hpc2 <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
## Convert date and time formats:
hpc3 <- transform(hpc2, Date = as.Date(hpc2$Date, format = "%d/%m/%Y"))
hpc4 <- transform(hpc3, Time = strptime(paste(hpc3$Date, hpc3$Time), 
                                        format = "%Y-%m-%d %H:%M:%S"))
## Convert the global active power to numeric:
gap1 <- as.vector(hpc4$Global_active_power)
gap2 <- as.numeric(gap1)
## Create the histogram:
hist(as.numeric(gap2), 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     main = "Global Active Power")
## Create the png file:
dev.copy(png, file = "plot1.png")
dev.off()
