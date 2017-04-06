my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power_data <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")

globalActivePower <- as.numeric(power_data$Global_active_power)
datetime <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
