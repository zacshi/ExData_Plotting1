#plot3
## get original data file and unzip it in designated directory, don't run it again afterwards.

## dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(dataset_url, "powerconsumption.zip")
## unzip("powerconsumption.zip", exdir = "consump_data")
## list.files("consump_data")
## get data file and unzip it in designated directory


## read data into RAM

mydata <- read.table("consump_data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

# use only data from the dates 2007-02-01 and 2007-02-02
usefuldata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

# convert the Date to Date class
usefuldata$Date <- as.Date(usefuldata$Date, format="%d/%m/%Y")

# convert the Time variable to Time class
usefuldata$Time <- strptime(paste(usefuldata$Date, usefuldata$Time), format="%Y-%m-%d %H:%M:%S")


# to make the plot 3

par(mfrow= c(1, 1))

plot(usefuldata$Time, usefuldata$Sub_metering_1, 
     type="l", xlab = "", ylab="Energy sub metering", cex.lab=0.7)

# add other submeterings as separate lines
lines(usefuldata$Time, usefuldata$Sub_metering_2, col="red")
lines(usefuldata$Time, usefuldata$Sub_metering_3, col="blue")

# annotate the graph with a legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), 
       col=c("black","red", "blue"), 
       cex=0.8)

# save the output to a png file
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()

# 
Sys.setlocale( category = "LC_TIME", locale = locale_original )

