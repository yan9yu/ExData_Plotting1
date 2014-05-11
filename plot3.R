# load all data
data <- read.csv("../household_power_consumption.txt",header=TRUE, sep=";",na.string="?")

# get target subset data
subdata <- subset(data,(data$Date=="1/2/2007" | data$Date=="2/2/2007"))

# format date
subdata$Date <- as.Date(subdata$Date,format="%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date,subdata$Time))

# plot plot3.png
png("plot3.png",width=480,height=480)
plot(subdata$DateTime,
     subdata$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Engergy sub metering")
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
       col=c("black","red","blue"))
dev.off()