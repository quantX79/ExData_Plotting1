
# Load data
obsData <- read.delim('household_power_consumption.txt',header = TRUE,sep=';',na.strings='?')
obsData$DateFormat <- as.Date(obsData$Date,'%d/%m/%Y')
obsData$TimeFormat <- strptime(paste(obsData$Date, obsData$Time),"%d/%m/%Y %H:%M:%S")
obsData <-obsData[obsData$DateFormat>=as.Date("2007-02-01") & obsData$DateFormat<=as.Date("2007-02-02"),]

# Generate plot 1
png('plot1.png',width = 480, height = 480)
hist(obsData$Global_active_power,xlab = 'Global Active Power (kilowatts)',main ='Global Active Power',col = "red")
dev.off()