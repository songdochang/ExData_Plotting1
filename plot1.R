source_data <- read.csv("./data/household_power_consumption.txt", 
                        sep = ";", stringsAsFactors = FALSE)
df <- subset(source_data, Date == '1/2/2007' | Date == '2/2/2007')

df$datetime <- with(df, strptime(paste(df$Date, df$Time), 
                                 format = "%d/%m/%Y %H:%M:%S"))

df$Global_active_power <- with(df, as.numeric(df$Global_active_power))

hist(df$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()