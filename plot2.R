# Read Data from provided file
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
# Change class of Date and Time
mydata[[1]] <- as.Date(mydata[[1]], format="%d/%m/%Y")
# Subset on provided Date range
testset <- subset(mydata, Date >="2007-02-01" & Date <="2007-02-02")
# Combine Date and Time
dt <- paste(as.character(testset$Date), testset$Time)
# Format as Date and Time
dt <- strptime(dt, format="%Y-%m-%d %H:%M:%S")
# Start plot
png('plot2.png',width=480,height=480)
plot(dt,testset$Global_active_power, type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(dt,testset$Global_active_power,type="l")
dev.off()