dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
januaryData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot1
png("plot1.png", width=480, height=480)
globalActivePowerNum <- as.numeric(januaryData$Global_active_power)
hist(globalActivePowerNum, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()