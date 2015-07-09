# plot1.R
# loads data for 2/1/2007 and 2/2/2007 and creates histogram in plot1.png

cols <- read.table("household_power_consumption.txt", sep=";",
                   nrows=1, stringsAsFactors=FALSE)
power_data <- read.table("household_power_consumption.txt",
                         header=FALSE, sep=";", skip=66637, nrows=2880,
                         col.names=cols)
png("plot1.png", width=480, height=480)
with(power_data, hist(Global_active_power, col="red", 
                      main="Global Active Power", 
                      xlab="Global Active Power (kilowatts)"))
dev.off()

