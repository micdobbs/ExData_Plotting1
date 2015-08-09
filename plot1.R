power=read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
trimmed_power=power[grepl("^(1|2)\\/2\\/2007",power$Date),]
png("plot1.png", width=480, height=480, units="px")
hist(trimmed_power$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
