# Plot 1 creates a histogram of global active power and frequency
# Set working directory and read data
wd <- setwd("/Users/lisa/Documents/Learning/R Programming/Project 1 Plots")
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# Extract global active power data and plot it in a png file
global_active_power <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
