##Loading data
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings = "?", dec=".")
## Appliying the proper format 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subsetting Data to ranges
sub_data <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Combining time and date
sub_data$TS <- as.POSIXct(paste(sub_data$Date, sub_data$Time, seperator = " "))

##Creating and exporting plots
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))
with(sub_data, {
        plot(sub_data$Global_active_power~sub_data$TS, type = "l", ylab = "Global Active Power", xlab = "")
        plot(sub_data$Voltage~sub_data$TS, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(sub_data$Sub_metering_1~sub_data$TS, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(sub_data$TS, sub_data$Sub_metering_2, col = "red")
        lines(sub_data$TS, sub_data$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
        plot(sub_data$Global_reactive_power~sub_data$TS, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
        
})

dev.off()
