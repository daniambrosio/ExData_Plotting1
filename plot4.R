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
par(mfrow=c(2,2), mar=c(4,4,2,1))

png(file = "plot4.png", width=480, height=480)

plot(subset_data$Datetime, subset_data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
# plot(subset_data$Datetime, subset_data$Sub_metering_1, type="l", xlab="", 
#      ylab="Energy Sub Metering")
# lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
# lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
# legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
#        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# 
# with(subset_data, {
#     
#     plot(Global_active_power~Datetime, type="l", 
#          ylab="Global Active Power (kilowatts)", xlab="")
#     plot(Voltage~Datetime, type="l", 
#          ylab="Voltage (volt)", xlab="")
#     plot(Sub_metering_1~Datetime, type="l", 
#          ylab="Global Active Power (kilowatts)", xlab="")
#     lines(Sub_metering_2~Datetime,col='Red')
#     lines(Sub_metering_3~Datetime,col='Blue')
#     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
#            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#     plot(Global_reactive_power~Datetime, type="l", 
#          ylab="Global Rective Power (kilowatts)",xlab="")
# })
# 


dev.off()

# go back to old working directory
setwd(old.dir)
