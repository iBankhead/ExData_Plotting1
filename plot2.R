#########################################################################################
# Plot 2
# Project 1 (Exploratory Data Analysis)
#########################################################################################

# Load the data
households <- read.csv("household_power_consumption.txt", sep = ";")

# Convert data and subset for relevant dates
households$Date <- as.Date(households$Date, "%d/%m/%Y")
households = households[households$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

# Convert factor to number for column 'Global_active_power'
households$Global_active_power <- as.numeric(as.character(households$Global_active_power))

# Create plot
par(mfrow = c(1, 1))
plot(strptime(paste(as.character(households$Date), as.character(households$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     households$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
