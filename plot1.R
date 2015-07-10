source('utils.R')

data <- readFile('input-data/household_power_consumption.txt')

# adding typed time and date to the matrix
data2 <- cbind(data, date_time = convertStringToDateTime(paste(data$Date, data$Time, sep = ' ')))

# filtering dates between 02/01 and 02/02
data3 <- subset(data2, isDateBetween('01/02/2007 00:00:00', '02/02/2007 23:59:59', date_time))

createHistogram <- function(data) {
  hist(
    as.numeric(as.character(data)), 
    breaks = 12, 
    col = 'red', 
    xlab = 'Global Activity Power (kilowatts)',
    main='Global Active Power'
  )
}

printToPng('figure/plot1.PNG', createHistogram(data3$Global_active_power))
