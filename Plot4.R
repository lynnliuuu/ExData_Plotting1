#read the  table and subset the data.frame
t <- read.table("household_power_consumption.txt", header = TRUE, 
                sep = ";", na.strings = "?")
t$Date <- as.Date(t$Date,"%d/%m/%Y")
t <- subset(t,t$Date >= "2007-02-01" & t$Date <= "2007-02-02")

#define the datatime column
datetime <- paste(t$Date,t$Time)
datetime <- setNames(datetime,"DateTime")
t <- cbind(datetime,t)
t$datetime <- as.POSIXct(t$datetime)

#plot4
par(mfrow=c(2,2))
plot(t$Global_active_power~t$datetime, type = "l",ylab = "Global Active Power")

plot(t$Voltage~t$datetime, type = "l", xlab = "datetime",ylab = "Vottage")

plot(t$Sub_metering_1~t$datetime,type="l",ylab="Energy sub metering", xlab = "")
lines(t$datetime,t$Sub_metering_2,col="red")
lines(t$datetime,t$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.5)


plot(t$Global_reactive_power~t$datetime,type="l",
     xlab="datetime",ylab="Global_reactive_rower")

#copy to png
dev.copy(png,file = "Plot4.png", width = 480, height = 480)
dev.off()
