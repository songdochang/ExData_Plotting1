source_data <- read.csv("./data/household_power_consumption.txt", 
                        sep = ";", stringsAsFactors = FALSE)
df <- subset(source_data, Date == '1/2/2007' | Date == '2/2/2007')

df$datetime <- with(df, strptime(paste(df$Date, df$Time), 
                                 format = "%d/%m/%Y %H:%M:%S"))

df$Sub_metering_1 <- with(df, as.numeric(df$Sub_metering_1))
df$Sub_metering_2 <- with(df, as.numeric(df$Sub_metering_2))
df$Sub_metering_3 <- with(df, as.numeric(df$Sub_metering_3))

plot(df$datetime, df$Sub_metering_1, type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(df$datetime, df$Sub_metering_1)
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1), y.intersp = 0.5)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()