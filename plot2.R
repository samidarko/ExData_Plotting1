dataset <- 'dataset.txt'

if (!file.exists(dataset)) {
  source('cleaning.R')
}

data = read.csv(dataset, sep = '')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png('plot2.png', width = 480, height = 480)
x <- 1:nrow(data)
plot(x, data$Global_active_power, pch = '.', ylab = 'Global Active Power', xlab = '', type = 'l', xaxt= 'n')
axis(1, at=c(min(x), median(x),  max(x)),labels=c("Thu", "Fri", "Sat"))
dev.off()