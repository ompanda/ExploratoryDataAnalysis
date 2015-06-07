## Load data from file
data <- read.csv("./data_source/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##format date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##getting valid data .We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## converting date as per R
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##code for plotting plot1
##hitogram plot

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

