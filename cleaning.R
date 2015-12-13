#' **variables setup**
archive <- 'household_power_consumption.zip'
sourceFile <- 'household_power_consumption.txt'
firstDay <- as.Date('2007-02-01')
lastDay <- as.Date('2007-02-02')

#' **Dataset download**
if (!file.exists(archive)) {
  url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip';
  download.file(url, method = 'curl', destfile = archive)
  unzip(archive)
}

#' **Extract subset of dates**
data <- read.csv('household_power_consumption.txt', sep = ';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
indexing = data$Date == firstDay | data$Date == lastDay
subdata = data[indexing, ]

#' **Export dataset**
write.table(subdata, "dataset.txt", row.names = FALSE)

