# plot2.R
# loads data for 2/1/2007 and 2/2/2007 and creates time history of 
# Global Active Power in plot2.png

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


png("plot2.png", width=480, height=480)

with(power_data, plot(DateTime, Global_active_power, type="l", 
                      ylab="Global Active Power (kilowatts)",
                      xlab=""))

dev.off()

