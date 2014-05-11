# load all data
data <- read.csv("../household_power_consumption.txt",header=TRUE, sep=";",na.string="?")

# get target subset data
subdata <- subset(data,(data$Date=="1/2/2007" | data$Date=="2/2/2007"))

# format date
subdata$DateTime <- strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S")

# plot plog2.png
png("plot2.png",width=480,height=480)
plot(subdata$DateTime,
     subdata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power(kilowatts)",
     axes=TRUE)
dev.off()