## Project 1 - Course 4 - Exploratory Data Analysis
## Coursera
## John Hopkins University
##
## Daniel Ambrosio
##

# save current directory and change wd to current source file's path
old.dir <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

if(!exists("subset_data")) source("get_file.R")

# plots the graphic
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(subset_data$Datetime, subset_data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")
plot(subset_data$Datetime, subset_data$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")
plot(subset_data$Datetime, subset_data$Sub_metering_1, type="l", xlab="", 
    ylab="Energy Sub Metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=0.5, y.intersp=0.8, xjust=1,
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subset_data$Datetime, subset_data$Global_reactive_power, type="l", 
     xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

# go back to old working directory
setwd(old.dir)
