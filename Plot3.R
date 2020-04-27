##Loading data
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")
##Format Date + Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset Data to date ranges provided
sub_data <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Combine Date + Time into new column
sub_data$TS <- as.POSIXct(paste(sub_data$Date, sub_data$Time, seperator = " "))

##Plotting and exporting Png
png("plot3.png", height = 480, width = 480)
plot(sub_data$Sub_metering_1~sub_data$TS, type = "l", ylab = "Energy sub metering", xlab = "")

## Add lines
lines(sub_data$TS, sub_data$Sub_metering_2, col = "red")
lines(sub_data$TS, sub_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))

dev.off()
