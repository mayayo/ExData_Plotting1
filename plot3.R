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


#plot3
png("plot3.png", width=480, height=480)
#Start by adding to the plot the first subset of data:
plot(dayofweek, sub_metering_1_num, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
#Then, add the other two lines with lines() function:
lines(dayofweek, sub_metering_2_num, col = "red")
lines(dayofweek, sub_metering_3_num, col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
dev.off()
