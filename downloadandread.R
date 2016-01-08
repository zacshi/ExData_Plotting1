## get orginal data file and unzip it in designated directory, don't run this section again afterwards.

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "powerconsumption.zip")
unzip("powerconsumption.zip", exdir = "consump_data")
list.files("consump_data")

## read data into RAM

mydata <- read.table("consump_data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )

# use only data from the dates 2007-02-01 and 2007-02-02
usefuldata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]


# convert the Date to Date class
usefuldata$Date <- as.Date(usefuldata$Date, format="%d/%m/%Y")
str(usefuldata)

# convert the Time variable to Time class

usefuldata$Time <- strptime(paste(usefuldata$Date, usefuldata$Time), format="%Y-%m-%d %H:%M:%S")

str(usefuldata)
