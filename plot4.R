dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
januaryData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates to day of week (x axis is day of week)
#First, we need to paste Date and Time together in one string. Then, call strptime on this string
dayofweek <- strptime(paste(januaryData$Date, januaryData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert all variables to plot (Sub_metering1, Sub_metering_2, Sub_metering_3) to numeric:
sub_metering_1_num <- as.numeric(januaryData$Sub_metering_1)
sub_metering_2_num <- as.numeric(januaryData$Sub_metering_2)
sub_metering_3_num <- as.numeric(januaryData$Sub_metering_3)
voltage_num <- as.numeric(januaryData$Voltage)
globalActivePower_num <- as.numeric(januaryData$Global_active_power)
globalReactivePower_num <- as.numeric(januaryData$Global_reactive_power)

#Configure panels for plotting the 4 graphs, it is a c(2,2) dimension
par(mfrow=c(2,2))

## Saving to file plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)


#Start creating the plots, from top-left to bottom-right

## Top-left plot: GlobalActivePower vs Day of week
plot(dayofweek, globalActivePower_num, xlab = "", ylab = "Global Active Power",  type = "l")

## Top-right plot:
plot(dayofweek, voltage_num, xlab = "datetime", ylab = "Voltage", type = "l")

## Bottom-left plot:
plot(dayofweek, sub_metering_1_num, xlab = "", ylab = "Energy sub metering", type = "l", col="black") 
lines(dayofweek, sub_metering_2_num, col = "red")
lines(dayofweek, sub_metering_2_num, col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty="n")

## Bottom-right plot: 
plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(newData)[4])

plot(dayofweek, globalReactivePower_num, xlab = "datetime", ylab = "Global reactive power",  type = "l")

#switch off device graphics
dev.off()






