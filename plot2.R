# Plot 2 creates a line graph of global active power over time
# Set working directory and read data
wd <- setwd("/Users/lisa/Documents/Learning/R Programming/Project 1 Plots")
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# Conmbine date and time and convert it to year month date format
datetime <- paste(subset$Date, subset$Time, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S") 

# Create plot of global active power over time
global_active_power <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()