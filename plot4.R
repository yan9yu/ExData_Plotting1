# load all data
data <- read.csv("../household_power_consumption.txt",header=TRUE, sep=";",na.string="?")

# get target subset data
subdata <- subset(data,(data$Date=="1/2/2007" | data$Date=="2/2/2007"))

# format date
subdata$Date <- as.Date(subdata$Date,format="%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date,subdata$Time))

# plot plot4.png
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(subdata$DateTime,
     subdata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
plot(subdata$DateTime,
     subdata$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(subdata$DateTime,
      subdata$Sub_metering_2,
      type="l",
      col="red")
lines(subdata$DateTime,
      subdata$Sub_metering_3,
      type="l",
      col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1,
       bty="n",
       col=c("black","red","blue"))
plot(subdata$DateTime,
     subdata$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
plot(subdata$DateTime,
     subdata$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()