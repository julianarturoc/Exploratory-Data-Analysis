##Loading data
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")
##Format Date + Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset Data to date ranges provided
sub_data <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Combine Date + Time into new column
sub_data$TS <- as.POSIXct(paste(sub_data$Date, sub_data$Time, seperator = " "))

##Output Plot to 480 x 480 png
png("plot2.png", height = 480, width = 480)
plot(sub_data$Global_active_power~sub_data$TS, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

