# load all data
data <- read.csv("../household_power_consumption.txt",header=TRUE, sep=";",na.string="?")
# get target subset data
subdata <- subset(data,(data$Date=="1/2/2007" | data$Date=="2/2/2007"))
# plot data
png("plot1.png",width=480,height=480)
hist(subdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
