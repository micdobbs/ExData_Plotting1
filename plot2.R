power=read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
trimmed_power=power[grepl("^(1|2)\\/2\\/2007",power$Date),]
trimmed_power$Date <- as.Date(trimmed_power$Date , "%d/%m/%Y")
trimmed_power$DateTime <- strptime(paste(trimmed_power$Date, trimmed_power$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480, units="px")
plot(trimmed_power$DateTime, trimmed_power$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
