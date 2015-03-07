power <- read.csv("household_power_consumption.txt", sep=";", quote="\"", na.strings = "?", stringsAsFactors = FALSE)
power_subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_subset <- transform(power_subset, Date_and_time = paste(Date, Time))
power_subset$Date_and_time <- strptime(power_subset$Date_and_time, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png")
with(power_subset, {
  plot(Date_and_time, Sub_metering_1, type = "l",
                        ylab = "Energy sub metering", xlab = "")
  legend("topright", col = c("black", "red", "blue"), lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  lines(Date_and_time, Sub_metering_2, col = "red")
  lines(Date_and_time, Sub_metering_3, col = "blue")
})
dev.off()