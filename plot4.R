power <- read.table("household_power_consumption.txt",
                    header = TRUE,
                    sep = ";",
                    na.strings = "?",
                    stringsAsFactors = FALSE)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

power$DateTime <- strptime(paste(power$Date, power$Time),
                           format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(power$DateTime, power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(power$DateTime, power$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(power$DateTime, power$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

plot(power$DateTime, power$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()