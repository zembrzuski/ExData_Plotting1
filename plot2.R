source('utils.R')

data <- readFile('input-data/household_power_consumption.txt')

# adding typed time and date to the matrix
data2 <- cbind(data, date_time = convertStringToDateTime(paste(data$Date, data$Time, sep = ' ')))

# filtering dates between 02/01 and 02/02
data3 <- subset(data2, isDateBetween('01/02/2007 00:00:00', '02/02/2007 23:59:59', date_time))

dataForPlotting <- data.frame(
  dateTime = data3$date_time, 
  measure = as.numeric(as.character(data3$Global_active_power))
)

doThePlotting <- function(data) {
  par(col="white")
  plot(data$dateTime, data$measure, ylab = 'Global Activity Power (kilowatts)', xlab = '')
  par(col="black")
  lines(data$dateTime, data$measure)
}

printToPng('figure/plot2.PNG', doThePlotting(dataForPlotting))
