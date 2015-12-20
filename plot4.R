#########################################################################################
# Plot 4
# Project 1 (Exploratory Data Analysis)
#########################################################################################

# Load the data
households <- read.csv("household_power_consumption.txt", sep = ";")

# Convert data and subset for relevant dates
households$Date <- as.Date(households$Date, "%d/%m/%Y")
households = households[households$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

# Convert factors to numbers
households$Global_active_power <- as.numeric(as.character(households$Global_active_power))
households$Voltage <- as.numeric(as.character(households$Voltage))
households$Global_reactive_power <- as.numeric(as.character(households$Global_reactive_power))
households$Sub_metering_1 <- as.numeric(as.character(households$Sub_metering_1))
households$Sub_metering_2 <- as.numeric(as.character(households$Sub_metering_2))
households$Sub_metering_3 <- as.numeric(as.character(households$Sub_metering_3))

# Create plot
par(mfrow = c(2, 2))

# Plot 1
plot(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     households$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Plot 2
plot(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     households$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Plot 3
plot(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     households$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")

lines(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
      households$Sub_metering_2, col="red")

lines(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
      households$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1, cex = 0.6, bty = "n")

# Plot 4
plot(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     households$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Save png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
