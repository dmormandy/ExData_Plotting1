# Read Data from provided file
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
# Change class of Date
mydata[[1]] <- as.Date(mydata[[1]], format="%d/%m/%Y")
# Subset on provided Date range
testset <- subset(mydata, Date >="2007-02-01" & Date <="2007-02-02")
# Take Global active power data for plot 1 as x
x <- as.numeric(testset$Global_active_power)
# Start plot
png('plot1.png',width=480,height=480)
hist(x,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

