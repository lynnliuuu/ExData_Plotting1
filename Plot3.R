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

#plot3
plot(t$Sub_metering_1 ~ t$datetime,type="l",
              ylab = "Energy sub metering", xlab="")
lines(t$datetime,t$Sub_metering_2,col="red")
lines(t$datetime,t$Sub_metering_3,col="blue")
legend("topright",lty = c(1,1,1), col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7)

#copy to png
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
