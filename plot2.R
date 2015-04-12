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

plot(subset_data$Datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

# go back to old working directory
setwd(old.dir)
