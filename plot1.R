dataset <- 'dataset.txt'

if (!file.exists(dataset)) {
  source('cleaning.R')
}

data = read.csv(dataset, sep = '')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png('plot1.png', width = 480, height = 480)
hist(data$Global_active_power, xlab='Global Active Power (kilowatts)', col='red', main = 'Global Active Power')
dev.off()
