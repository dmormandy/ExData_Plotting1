# Read Data from provided file
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
# Change class of Date and Time
mydata[[1]] <- as.Date(mydata[[1]], format="%d/%m/%Y")
# Subset on provided Date range
testset <- subset(mydata, Date >="2007-02-01" & Date <="2007-02-02")
# Combine Date and Time
dt <- paste(as.character(testset$Date), testset$Time)
#Format as Date and Time
dt <- strptime(dt, format="%Y-%m-%d %H:%M:%S")
# Start plot
png('plot4.png',width=480,height=480)
# Specify 4 subplots: 2 per col, 2 per row
par(mfrow=c(2,2))
# Top left: Global Active Power
plot(dt,testset$Global_active_power, type="n",ylab="Global Active Power",xlab="")
lines(dt,testset$Global_active_power,type="l")
# Top right: Voltage
plot(dt,testset$Voltage, type="n",ylab="Voltage",xlab="datetime")
lines(dt,testset$Voltage,type="l")
# Bottom left: Sub metering
plot(dt,testset$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(dt,testset$Sub_metering_1,type="l")
lines(dt,testset$Sub_metering_2,type="l",col="red")
lines(dt,testset$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c('black','red', 'blue'),cex=.85, bty="n")
# Bottom right: Global reactive power
plot(dt,testset$Global_reactive_power, type="n",ylab="Global_reactive_power",xlab="datetime")
lines(dt,testset$Global_reactive_power,type="l")
dev.off()