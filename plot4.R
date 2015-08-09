power=read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
trimmed_power=power[grepl("^(1|2)\\/2\\/2007",power$Date),]
trimmed_power$Date <- as.Date(trimmed_power$Date , "%d/%m/%Y")
trimmed_power$DateTime <- strptime(paste(trimmed_power$Date, trimmed_power$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

plot(trimmed_power$DateTime, trimmed_power$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(trimmed_power$DateTime, trimmed_power$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(trimmed_power$DateTime, trimmed_power$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col="Black")
lines(trimmed_power$DateTime, trimmed_power$Sub_metering_2, col="Red")
lines(trimmed_power$DateTime, trimmed_power$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("Black", "Red", "Blue"), lty=1, bty="n")

plot(trimmed_power$DateTime, trimmed_power$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
