#Course Project 1 - Exploratory Data Analysis

#Plot 1

# 1. Load the data. 
# Data must be saved in the working directory.
        library(data.table)
        mydata <- fread("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings="?")
        mydata <- subset(mydata, Date == "1/2/2007"| Date == "2/2/2007")
        mydata <- as.data.frame(mydata)
        mydata$Time <- paste(mydata$Date,mydata$Time)
        mydata$Time <- strptime(mydata$Time, "%d/%m/%Y %H:%M:%S", tz = "GMT")
        mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
        
#2. Construct the plot and save as png.
        png("plot1.png")
        hist(mydata$Global_active_power, col = "red", main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
        dev.off()
        