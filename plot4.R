Sys.setlocale("LC_TIME", "en_US.UTF-8") 
data <- read.csv2("/Users/tiagoassano/Documents/household_power_consumption.txt", stringsAsFactors = FALSE)
data <- mutate(data, Complete_date = paste(Date, Time))
data$Time <- strptime(data$Time, format = "%T")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Complete_date <- strptime(data$Complete_date, format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data1<- subset(data,Date=="2007-02-01"| Date=="2007-02-02")

# Plots
png(filename="plot4.png")
par(mfrow = c(2,2))
par(mar = c(2,2,2,2))
par(mai =c(1,1,0.3,0.3))

with(data1, plot(Complete_date, Global_active_power, type ="l", 
                 ylab = "Global Active Power (kilowatts)", xlab = ""))

with(data1, plot(Complete_date, Voltage, type ="l", 
                 ylab = "Global Active Power (kilowatts)", xlab = "datetime"))

with(data1, plot(Complete_date, Sub_metering_1, type ="l", 
                 ylab = "Energy Submetering", xlab = ""))
with(data1, lines(Complete_date, Sub_metering_2, type="l", col = "red"))
with(data1, lines(Complete_date, Sub_metering_3, type="l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"), cex = 0.6  ) 

with(data1, plot(Complete_date, Global_reactive_power, type ="l", 
                 ylab = "Global Reactive Power (kilowatts)", xlab = "datetime"))

dev.off()