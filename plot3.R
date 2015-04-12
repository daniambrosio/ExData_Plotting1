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

par(mfrow=c(1,1), mar=c(4,4,4,4), oma=c(0,0,0,0))
png(filename = "plot3.png", width=480, height=480)

plot(subset_data$Datetime, subset_data$Sub_metering_1, type="l", xlab="", 
     ylab="Energy Sub Metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, xjust=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

# go back to old working directory
setwd(old.dir)
