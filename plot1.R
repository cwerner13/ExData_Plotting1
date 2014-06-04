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


# Plot 1

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, type ="windows")

    hist(as.numeric(data$Global_active_power)
        , col = "red"
        , breaks =12
        , main = "Global Active Power"
        , xlab = "Global Active Power (kilowatts)"
        , ylab = "Frequency")

dev.off()
