source_data <- read.csv("./data/household_power_consumption.txt", 
                        sep = ";", stringsAsFactors = FALSE)
df <- subset(source_data, Date == '1/2/2007' | Date == '2/2/2007')

df$datetime <- with(df, strptime(paste(df$Date, df$Time), 
                                 format = "%d/%m/%Y %H:%M:%S"))

df$Global_active_power <- with(df, as.numeric(df$Global_active_power))

plot(df$datetime, df$Global_active_power, type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(df$datetime, df$Global_active_power)

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()