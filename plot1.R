my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power_data <- subset(my_data, Date == "1/2/2007" | Date == "2/2/2007")

globalActivePower <- as.numeric(power_data$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(globalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
