setwd("~/ExData_Plotting1/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/ExData_Plotting1/household_power.zip", method = "curl")
unzip("~/ExData_Plotting1/household_power.zip")
dateDownloaded <- date()

data <- read.table(pipe("grep -w -e ^1/2/2007 -e ^2/2/2007 ~/ExData_Plotting1/household_power_consumption.txt"), header=FALSE, fill = TRUE, sep=";")
data$Date <- paste(data[,1], data[,2], sep=" ") 
data$Date <- dmy_hms(data$Date)

png(filename = "~/ExData_Plotting1/plot1.png", width = 504, height = 504, units = "px", bg = "white")
hist(data$V3, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()