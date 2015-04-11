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

wd = "./data"
zipFile <- paste(wd,"projectdata.zip",sep="/")
unzippedFile <- paste(wd,"household_power_consumption.txt",sep="/")

#
# Get the remote data into a working data folder and unzip it
#
if(!file.exists(wd)) {dir.create(wd)}
if(!file.exists(zipFile)) {
    print("downloading zip file...")
    zipFileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(zipFileURL, destfile=zipFile, method="curl")    
} else {
    print("zip file found - no need to download again")
}

if(!file.exists(unzippedFile)) {
    print("unzipping file...")
    unzip(zipFile, exdir=wd)
} else {
    print("unzipped file found - skipping")
}

if (!exists("full_table")) {
    print("Reading table...")
    s <- system.time({
        full_table <- read.table(unzippedFile,header=TRUE,
                                 sep=";",na.strings="?",
                                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))        
    })
    print(s)
    
    print("Converting Date Column...")
    # convert character to time    
    s <- system.time({
        full_table$Date <- as.Date(full_table$Date, format = "%d/%m/%Y")
    })
    print(s)
    
    
    print("Converting Time Column...")
    # convert character to time    
    s <- system.time({
        full_table$Datetime <- strptime(paste(full_table$Date,full_table$Time), format = "%Y-%m-%d %H:%M:%S")
    })
    print(s)
} else {
    print("table found - will not load!")
}

# subset for the working dates only - as specified in the project
print("Subsetting...")
subset_data <- subset(full_table, Date >= "2007-02-01" & Date <= "2007-02-02")

# go back to old working directory
setwd(old.dir)

print("Done!")