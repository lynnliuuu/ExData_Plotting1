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

#plot2
plot(formula = t$Global_active_power ~ t$datetime, type="l",
              ylab = "Global Active Power (kilowatts)", xlab="")

#copy to png
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()