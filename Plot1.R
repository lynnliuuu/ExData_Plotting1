#read the  table and subset the data.frame
t <- read.table("household_power_consumption.txt", header = TRUE, 
                sep = ";", na.strings = "?")
t$Date <- as.Date(t$Date,"%d/%m/%Y")
t <- subset(t,t$Date >= "2007-02-01" & t$Date <= "2007-02-02")

#define the datatime column
datetime <- paste(t$Date,t$Time)
datetime <- setNames(datetime,"DateTime")
t <- cbind(datetime,t)
t$datetime <- as.POSIXlt(t$datetime)

#plot1
hist(t$Global_active_power,main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

#copy to png
dev.copy(png, "Plot1.png",width = 480, height = 480)
dev.off()

