setwd("~/ExData_Plotting1/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/ExData_Plotting1/household_power.zip", method = "curl")
unzip("~/ExData_Plotting1/household_power.zip")
dateDownloaded <- date()

data <- read.table(pipe("grep -w -e ^1/2/2007 -e ^2/2/2007 ~/ExData_Plotting1/household_power_consumption.txt"), header=FALSE, fill = TRUE, sep=";")
data$Date <- paste(data[,1], data[,2], sep=" ") 
data$Date <- dmy_hms(data$Date)

png(filename = "~/ExData_Plotting1/plot3.png", width = 504, height = 504, units = "px", bg = "white")
plot(data$Date, data$V7, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$V8,col="red")
lines(data$Date, data$V9,col="blue")
legend(c("topright"), c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1), lwd = c(2.5,2.5,2.5),col = c("black","red", "blue"))
dev.off()