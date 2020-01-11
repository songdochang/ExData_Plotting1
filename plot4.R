source_data <- read.csv("./data/household_power_consumption.txt", 
                        sep = ";", stringsAsFactors = FALSE)
df <- subset(source_data, Date == '1/2/2007' | Date == '2/2/2007')

df$datetime <- with(df, strptime(paste(df$Date, df$Time), 
                                 format = "%d/%m/%Y %H:%M:%S"))

df$Global_active_power <- with(df, as.numeric(df$Global_active_power))
df$Voltage <- with(df, as.numeric(df$Voltage))
df$Sub_metering_1 <- with(df, as.numeric(df$Sub_metering_1))
df$Sub_metering_2 <- with(df, as.numeric(df$Sub_metering_2))
df$Sub_metering_3 <- with(df, as.numeric(df$Sub_metering_3))
df$Global_reactive_power <- with(df, as.numeric(df$Global_reactive_power))

par(mfrow = c(2,2))

plot(df$datetime, df$Global_active_power, type = "n",
     xlab = "",
     ylab = "Global Active Power")
lines(df$datetime, df$Global_active_power)

plot(df$datetime, df$Voltage, type = "n",
     xlab = "datetime", ylab = "Voltage")
lines(df$datetime, df$Voltage)

plot(df$datetime, df$Sub_metering_1, type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$datetime, df$Sub_metering_1)
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1), bty = "n", 
       y.intersp = 0.4, cex = 0.9)

plot(df$datetime, df$Global_reactive_power, type = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power")
lines(df$datetime, df$Global_reactive_power)

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()