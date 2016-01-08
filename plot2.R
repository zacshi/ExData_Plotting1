## complete code for plot 2 making
## get original data file and unzip it in designated directory, don't run it again afterwards.

## dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(dataset_url, "powerconsumption.zip")
## unzip("powerconsumption.zip", exdir = "consump_data")
## list.files("consump_data")


## read data into RAM

mydata <- read.table("consump_data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

# use only data from the dates 2007-02-01 and 2007-02-02
usefuldata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]



# convert the Date to Date class
usefuldata$Date <- as.Date(usefuldata$Date, format="%d/%m/%Y")
# str(usefuldata)

# convert the Time variable to Time class

usefuldata$Time <- strptime(paste(usefuldata$Date, usefuldata$Time), format="%Y-%m-%d %H:%M:%S")
# str(usefuldata)

# set up locale
locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

# to make plot 2
par(mfrow= c(1, 1))

with(usefuldata, plot(Time, Global_active_power, 
                         type="l",
                         xlab="",
                         ylab="Global Active Power (in kilowatts)",
                         cex.lab=0.7, cex.axis=0.8))

# save the output to plot2.png
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()

# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = locale_original )

# The end
