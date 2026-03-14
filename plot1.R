power <- read.table("household_power_consumption.txt",
                    header = TRUE,
                    sep = ";",
                    na.strings = "?",
                    stringsAsFactors = FALSE)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
power$Global_active_power <- as.numeric(power$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(power$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
