power <- read.table("household_power_consumption.txt",
                    header = TRUE,
                    sep = ";",
                    na.strings = "?",
                    stringsAsFactors = FALSE)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

power$DateTime <- strptime(paste(power$Date, power$Time),
                           format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

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

dev.off()