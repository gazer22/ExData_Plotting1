# plot3.R
# loads data for 2/1/2007 and 2/2/2007 and creates time history of 
# Sub metering in plot3.png

# load data
unzip("household_power_consumption.zip")

cols <- read.table("household_power_consumption.txt", sep=";",
                   nrows=1, stringsAsFactors=FALSE)
power_data <- read.table("household_power_consumption.txt",
                         header=FALSE, sep=";", skip=66637, nrows=2880,
                         col.names=cols)

# convert Date to date format
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# combine date & time into one data set
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time), 
                                format="%Y-%m-%d %H:%M:%S")


png("plot3.png", width=480, height=480)

#make plot
with(power_data, {
    plot(DateTime, Sub_metering_1, type="n", 
         ylab="Energy sub metering",
         xlab="")
    lines(DateTime, Sub_metering_1, type="l", col="black")
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="purple")
} )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1), col=c("black", "red", "purple"))

dev.off()

