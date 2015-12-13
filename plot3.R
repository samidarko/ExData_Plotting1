dataset <- 'dataset.txt'

if (!file.exists(dataset)) {
  source('cleaning.R')
}

data = read.csv(dataset, sep = '')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png('plot3.png', width = 480, height = 480)
x <- 1:nrow(data)
plot(x, data$Sub_metering_1, pch = '.', ylab = 'Energy sub metering', xlab = '', type = 'n', xaxt= 'n')
axis(1, at=c(min(x), median(x),  max(x)),labels=c("Thu", "Fri", "Sat"))

sub_metering <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
colors <- c('black', 'red', 'blue')

for (index in 1:3) {
  # points(x, data[sub_metering[index]], col = colors[index], pch = '.', type = 'l')
  # legend('topright', legend = sub_metering[index], pch = '-', col = colors[index])
}
points(x, data$Sub_metering_1, col = 'black', pch = '.', type = 'l')
points(x, data$Sub_metering_2, col = 'red', pch = '.', type = 'l')
points(x, data$Sub_metering_3, col = 'blue', pch = '.', type = 'l')
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"))
dev.off()
