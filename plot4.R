# Plot 4 creates 4 plots of the previous 3 plots and voltage over time line graph
# Set working directory and read data
wd <- setwd("/Users/lisa/Documents/Learning/R Programming/Project 1 Plots")
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# Conmbine date and time and convert it to year month date format
datetime <- paste(subset$Date, subset$Time, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S") 

# Convert to numeric the data that will be plotted
global_active_power <- as.numeric(subset$Global_active_power)
global_reactive_power <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)
sub_metering1 <- as.numeric(subset$Sub_metering_1)
sub_metering2 <- as.numeric(subset$Sub_metering_2)
sub_metering3 <- as.numeric(subset$Sub_metering_3)

# Create 4 plots of the previous 2 plots and voltage over time and global reactive power over time
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()