## for plot 4

## get data file and unzip it in designated directory

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

# convert the Time variable to Time class

usefuldata$Time <- strptime(paste(usefuldata$Date, usefuldata$Time), format="%Y-%m-%d %H:%M:%S")

# to make plot 4

par(mfrow=c(2,2))

# topleft
with(usefuldata, plot(Time, Global_active_power, 
                         type="l",
                         xlab="", 
                         ylab="Global Active Power", 
                         cex.lab=0.7, cex.axis=0.8,
))

# topright
with(usefuldata, plot(Time, Voltage, 
                         type="l",
                         xlab="datetime",
                         ylab="Voltage", 
                         cex.lab=0.7, cex.axis=0.8,
))

# bottomleft
plot(usefuldata$Time, usefuldata$Sub_metering_1, 
     type="l", 
     ylab="Energy sub metering", 
     xlab="", 
     cex.lab=0.7, 
     cex.axis=0.8)

lines(usefuldata$Time, usefuldata$Sub_metering_2, col="red")
lines(usefuldata$Time, usefuldata$Sub_metering_3, col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), 
       col=c("black","red", "blue"), 
       cex=0.7, 
       bty="n")

# bottomright
with(usefuldata, plot(Time, usefuldata$Global_reactive_power, 
                      type="l",lwd=0.5,
                      xlab="datetime", 
                      ylab="Global_reactive_power", 
                      cex.lab=0.7, 
                      cex.axis=0.8))

# copy to a PNG file
dev.copy(png,'plot4.png',  width = 480, height = 480)
dev.off()


# The end



