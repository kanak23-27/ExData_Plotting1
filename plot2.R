power <- read.table("household_power_consumption.txt",
                    header = TRUE,
                    sep = ";",
                    na.strings = "?",
                    stringsAsFactors = FALSE)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
power$Global_active_power <- as.numeric(power$Global_active_power)

power$DateTime <- strptime(paste(power$Date, power$Time),
                           format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(power$DateTime, power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()