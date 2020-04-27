# loading data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
# Subbseting data according to analysis time-span
sub_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
# creating plot in png format
png("plot1.png", height = 480, width = 480)
hist(as.numeric(as.character(sub_data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()