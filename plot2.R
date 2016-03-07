dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
januaryData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


## Converting dates to day of week (x axis is day of week)
#First, we need to paste Date and Time together in one string. Then, call strptime on this string
dayofweek <- strptime(paste(januaryData$Date, januaryData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot2
png("plot2.png", width=480, height=480)
globalActivePowerNum <- as.numeric(januaryData$Global_active_power)
plot(dayofweek, globalActivePowerNum,  ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()