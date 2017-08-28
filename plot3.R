# Plot 3 creates a line graph of the 3 sub metering columns over time
# Set working directory and read data
wd <- setwd("/Users/lisa/Documents/Learning/R Programming/Project 1 Plots")
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# Conmbine date and time and convert it to year month date format
datetime <- paste(subset$Date, subset$Time, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S") 

#Extract only the necessary data
global_active_power <- as.numeric(subset$Global_active_power)
sub_metering1 <- as.numeric(subset$Sub_metering_1)
sub_metering2 <- as.numeric(subset$Sub_metering_2)
sub_metering3 <- as.numeric(subset$Sub_metering_3)

# Plot chart with the 3 sub metering lines and create legend
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()