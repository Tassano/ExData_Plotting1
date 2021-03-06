Sys.setlocale("LC_TIME", "en_US.UTF-8") 
data <- read.csv2("/Users/tiagoassano/Documents/household_power_consumption.txt", stringsAsFactors = FALSE)
data$Time <- strptime(data$Time, format = "%T")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data1<- subset(data,Date=="2007-02-01"| Date=="2007-02-02")
png(filename="plot1.png")
hist(data1$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()