# ===== Data Science - Exploratory Data Analysis
# =====                     plot4.R
# ===== This routine constructs a histogram of household global minute-averaged
#       active power (in kilowatt) from the dates 2007-02-01 and 2007-02-02
# ===== The resulting plot is saved to a PNG file with a width of 480 pixels and a height of 480 pixels.
# ===== The plot file name is plot4.png
# =====
# ===== The data is sourced from 
# ===== http://archive.ics.uci.edu/ml/  via
#       https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# =====
# ===== 2016-04-18 - whbrown555 - initial code
#
# =============================== BEGIN ==========================================================

# ===== install and load lubridate
# install.packages("lubridate")
# library(lubridate)
# # ===== initial download
# setwd("C:/Users/William/Documents/DataScience/ExploratoryDataAnalysis")
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
#               destfile = "exdata-data-household-power-consumption.zip")

# extract the .txt file outside of R
inputFolder <- "C:/Users/William/Documents/DataScience/ExploratoryDataAnalysis/exdata-data-household-power-consumption"
outputFolder <- "C:/Users/William/Documents/GitHub/ExData_Plotting1/figure"

# load file, extract data for 2007-02-01 thru 2007-02-02, generate a date time column
setwd(inputFolder)
hhpow <- read.table("household_power_consumption.txt", na.strings = "?",stringsAsFactors = FALSE, sep = ";", header = TRUE)
hhpow$Date <- dmy(hhpow$Date)
hhpow <- subset(hhpow, (hhpow$Date == ymd("2007-02-01") | hhpow$Date == ymd("2007-02-02")))
hhpow$datetime<- as.POSIXct(paste(hhpow$Date, hhpow$Time), format="%Y-%m-%d %H:%M:%S")


# ==== plot the lines
setwd(outputFolder)
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2), mar = c(5, 4, 4, 2), oma = c(1, 1, 2, 1))
# get the range for the Sub_metering_1 x and y axis 
xrange <- range(hhpow$datetime) 
yrange <- range(hhpow$Sub_metering_1 ) 

with(hhpow, {
    # ==== plot TOP LEFT
    plot(datetime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power" )
    # ==== plot TOP RIGHT
    plot(datetime,Voltage, type = "l")
    
    # ==== plot BOTTOM LEFT
    # set up the plot 
    plot(xrange, yrange, type="n", xlab="",  ylab="Energy sub metering" ) 
        # add lines 
        lines(datetime, Sub_metering_1, type="l", col="black")
        lines(datetime, Sub_metering_2, type="l", col="red")
        lines(datetime, Sub_metering_3, type="l", col="blue") 
        # add a legend 
        legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.85,
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
    
    # ==== plot BOTTOM RIGHT
    plot(datetime,Global_reactive_power, type = "l")
})
# write the file
dev.off()
# ===============================  END plot4.R ==========================================================
