# ===== Data Science - Exploratory Data Analysis
# =====                     plot1.R
# ===== This routine constructs a histogram of household global minute-averaged
#       active power (in kilowatt) from the dates 2007-02-01 and 2007-02-02
# ===== The resulting plot is saved to a PNG file with a width of 480 pixels and a height of 480 pixels.
# ===== The plot file name is plot1.png
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
# 
# # ===== initial download
# setwd("C:/Users/William/Documents/DataScience/ExploratoryDataAnalysis")
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
#               destfile = "exdata-data-household-power-consumption.zip")
# 
# extract the .txt file outside of R
inputFolder <- "C:/Users/William/Documents/DataScience/ExploratoryDataAnalysis/exdata-data-household-power-consumption"
outputFolder <- "C:/Users/William/Documents/GitHub/ExData_Plotting1/figure"

# load file
setwd(inputFolder)
hhpow <- read.table("household_power_consumption.txt", na.strings = "?",stringsAsFactors = FALSE, sep = ";", header = TRUE)
hhpow$Date <- dmy(hhpow$Date)
hhpow <- subset(hhpow, (hhpow$Date == ymd("2007-02-01") | hhpow$Date == ymd("2007-02-02")))

# ==== plot the histogram
setwd(outputFolder)
png(filename = "plot1.png", height = 480, width = 480)
with(hhpow, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# write the file
dev.off()
# ===============================  END plot1.R ==========================================================
