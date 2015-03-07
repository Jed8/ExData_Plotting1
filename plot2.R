power <- read.csv("household_power_consumption.txt", sep=";", quote="\"", na.strings = "?", stringsAsFactors = FALSE)
power_subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_subset <- transform(power_subset, Date_and_time = paste(Date, Time))
power_subset$Date_and_time <- strptime(power_subset$Date_and_time, format = "%d/%m/%Y %H:%M:%S")
with(power_subset, plot(Date_and_time, Global_active_power, type = "l",
                        ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "plot2.png")
dev.off()
