power <- read.csv("household_power_consumption.txt", sep=";", quote="\"", na.strings = "?", stringsAsFactors = FALSE)
power_subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
with(power_subset, hist(Global_active_power, col = "red",
                        xlab = "Global Active Power (kilowatts)",
                        main = "Global Active Power"))
dev.copy(png, file = "plot1.png")
dev.off()