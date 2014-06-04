# This assignment uses data from the UC Irvine Machine Learning Repository “Individual 
# household electric power consumption Data Set”, including measurements of electric 
# power consumption in one household with a one-minute sampling rate over a period 
# of almost 4 years

# Construct Plot and
#  - save it to a PNG file
#  - with a width of 480 pixels and a height of 480 pixels
#  - We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#  - English/US weekday labeling is required


# Options
options(stringsAsFactors = FALSE)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

# load data
data_all <- read.table("../../data/household_power_consumption.txt"
                       , header = TRUE
                       , sep=";")
# munge data
timestamp          <- paste(data_all$Date, data_all$Time)
data_all$timestamp <- strptime(timestamp, "%d/%m/%Y %H:%M:%S")
data_all$Date      <- as.Date(data_all$Date, "%d/%m/%Y")

# subset data
data               <- data_all[(data_all$Date == as.Date("01/02/2007", "%d/%m/%Y")
                               |data_all$Date == as.Date("02/02/2007", "%d/%m/%Y")), ]


# Plot 4

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent",  res = NA, type ="windows")

    par(mfrow = c(2, 2)
    #, mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)
    )
    with(data, {
            
        plot (timestamp, as.numeric(Global_active_power),type="n"
              , main="", xlab = "", ylab = "Global Active Power")
        lines(timestamp,as.numeric(Global_active_power), type="l") 
        
        plot (timestamp, as.numeric(Voltage),type="n"
              , main="", xlab = "datetime", ylab = "Voltage")
        lines(timestamp,as.numeric(Voltage), type="l")
        
        plot( data$timestamp, as.numeric(data$Sub_metering_1),type="n"
              , main="", xlab = "", ylab = "Energy sub metering")
        lines(data$timestamp, as.numeric(data$Sub_metering_1), type="l") 
        lines(data$timestamp, as.numeric(data$Sub_metering_2), type="l", col="red") 
        lines(data$timestamp, as.numeric(data$Sub_metering_3), type="l", col="blue") 
        legend("topright", pch = NA, lty= 1, bty="n"
               , col    = c("black","blue", "red")
               , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        
        plot (timestamp, as.numeric(Global_reactive_power),type="n"
              , main="", xlab = "datetime", ylab = "Global_reactive_power")
        lines(timestamp,as.numeric(Global_reactive_power), type="l")
        
        #  mtext("Ozone and Weather in New York City", outer = TRUE)
    })

dev.off()