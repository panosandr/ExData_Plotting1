my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power_data <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")

globalActivePower <- as.numeric(power_data$Global_active_power)
voltage <- as.numeric(power_data$Voltage)
subMetering1 <- as.numeric(power_data$Sub_metering_1)
subMetering2 <- as.numeric(power_data$Sub_metering_2)
subMetering3 <- as.numeric(power_data$Sub_metering_3)
globalReactivePower <- as.numeric(power_data$Global_reactive_power)
datetime <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, xlab = "", ylab = "Global Active Power", type = "l")

plot(datetime, voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(datetime, globalReactivePower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()




