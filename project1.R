data <- read.table(pipe("grep -w -e ^1/2/2007 -e ^2/2/2007 /Users/colin/ExData_Plotting1/household_power_consumption.txt"), header=FALSE, fill = TRUE, sep=";")
data$Date <- paste(data[,1], data[,2], sep=" ") 
data$Date <- dmy_hms(data$Date)

hist(data$V3, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", cex.lab=0.7, cex.axis=0.7, cex.main=0.8)

plot(data$Date, data$V3, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab=0.7, cex.axis=0.7)

plot(data$Date, data$V7, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$V8,col="red")
lines(data$Date, data$V9,col="blue")
legend(c("topright"), c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1), lwd = c(2.5,2.5,2.5),col = c("black","red", "blue"))

par(mfrow = c(2,2))
plot(data$Date, data$V3, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Date, data$V5, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Date, data$V7, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$V8,col="red")
lines(data$Date, data$V9,col="blue")
legend(c("topright"), c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1), lwd = c(2.5,2.5,2.5),col = c("black","red", "blue"))
plot(data$Date, data$V4, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
