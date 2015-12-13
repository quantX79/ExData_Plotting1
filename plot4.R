# Load data
obsData <- read.delim('household_power_consumption.txt',header = TRUE,sep=';',na.strings='?')
obsData$DateFormat <- as.Date(obsData$Date,'%d/%m/%Y')
obsData$TimeFormat <- strptime(paste(obsData$Date, obsData$Time),"%d/%m/%Y %H:%M:%S")
obsData <-obsData[obsData$DateFormat>=as.Date("2007-02-01") & obsData$DateFormat<=as.Date("2007-02-02"),]

# Generate plot 4
png('plot4.png',width = 480, height = 480)
par(mfrow=c(2,2))
plot(obsData$TimeFormat,obsData$Global_active_power,type="l",xlab='',ylab = 'Global Active Power')
plot(obsData$TimeFormat,obsData$Voltage,type="l",xlab='datetime',ylab = 'Voltage')
plot(obsData$TimeFormat,obsData$Sub_metering_1,col='black',type="l",xlab='',ylab = 'Energy sub metering')
lines(obsData$TimeFormat,obsData$Sub_metering_2,col='red')
lines(obsData$TimeFormat,obsData$Sub_metering_3,col='blue')
legend(x='topright',xjust='right',yjust='top',pch = c("-","-","-"),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),bty='n',border = "white")
plot(obsData$TimeFormat,obsData$Global_reactive_power,type="l",xlab='datetime',ylab = 'Global_reactive_power')
dev.off()