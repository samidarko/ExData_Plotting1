dataset <- 'dataset.txt'

if (!file.exists(dataset)) {
  source('cleaning.R')
}

data = read.csv(dataset, sep = '')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#' **2 rows by 2 columns**

png('plot4.png', width = 480, height = 480)

par(mfrow=c(2,2))

x <- 1:nrow(data)

#' plot top left
plot(x, data$Global_active_power, pch = '.', ylab = 'Global Active Power', xlab = '', type = 'l', xaxt= 'n')
axis(1, at=c(min(x), median(x),  max(x)),labels=c("Thu", "Fri", "Sat"))

#' plot top right
plot(x, data$Voltage, pch = '.', ylab = 'Voltage', xlab = 'datetime', type = 'l', xaxt= 'n')
axis(1, at=c(min(x), median(x),  max(x)),labels=c("Thu", "Fri", "Sat"))

#' plot bottom left
plot(x, data$Sub_metering_1, pch = '.', ylab = 'Energy sub metering', xlab = '', type = 'n', xaxt= 'n')
axis(1, at=c(min(x), median(x),  max(x)),labels=c("Thu", "Fri", "Sat"))
points(x, data$Sub_metering_1, col = 'black', pch = '.', type = 'l')
points(x, data$Sub_metering_2, col = 'red', pch = '.', type = 'l')
points(x, data$Sub_metering_3, col = 'blue', pch = '.', type = 'l')
legend("topright", lty=1, bty="n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"))

#' plot bottom right
plot(x, data$Global_reactive_power, pch = '.', ylab = 'Global_reactive_power', xlab = 'datetime', type = 'l', xaxt= 'n')
axis(1, at=c(min(x), median(x),  max(x)),labels=c("Thu", "Fri", "Sat"))

dev.off()