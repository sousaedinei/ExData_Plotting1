#Course Project 1 - Exploratory Data Analysis

#Plot 4

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
        png("plot4.png")
        par(mfrow = c(2, 2))
        #Global Active Power X datetime
        with(mydata, plot(Time, Global_active_power, type = "n",
                          ylab = "Global Active Power",
                          xlab = ""))
        with(mydata, lines(Time, Global_active_power))
        
        #Voltage X datetime
        with(mydata, plot(Time, Voltage, type = "n",
                          ylab = "Voltage",
                          xlab = "datetime"))
        with(mydata, lines(Time, Voltage))
        
        #Energy sub metering X datetime
        with(mydata, plot(Time, Sub_metering_1, type = "n",
                          ylab = "Energy sub metering",
                          xlab = ""))
        with(mydata, lines(Time, Sub_metering_1))
        with(mydata, lines(Time, Sub_metering_2, col="red"))
        with(mydata, lines(Time, Sub_metering_3, col="blue"))
        legend("topright", lwd=c(2,2,2), lty=c(1,1,1), col = c("black","red","blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               y.intersp = 1, x.intersp = 0.2, cex = 0.8, box.lwd = 1, yjust = 0, 
               xjust = 0, seg.len = 1.5, bty = "n")
        
        #Global Reactive Power X datetime
        with(mydata, plot(Time, Global_reactive_power, type = "n",
                          ylab = "Global Reactive Power",
                          xlab = "datetime"))
        with(mydata, lines(Time, Global_reactive_power))
        dev.off()
        