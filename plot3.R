source('utils.R')

data <- readFile('input-data/household_power_consumption.txt')

# adding typed time and date to the matrix
data2 <- cbind(data, date_time = convertStringToDateTime(paste(data$Date, data$Time, sep = ' ')))

# filtering dates between 02/01 and 02/02
data3 <- subset(data2, isDateBetween('01/02/2007 00:00:00', '02/02/2007 23:59:59', date_time))

dataForPlotting <- data.frame(
  dateTime = data3$date_time,
  metering1 = as.numeric(as.character(data3$Sub_metering_1)),
  metering2 = as.numeric(as.character(data3$Sub_metering_2)),
  metering3 = as.numeric(as.character(data3$Sub_metering_3))
)

doThePlotting <- function(exercise3) {
  par(col="white") # plotting symbol and color 
  plot(exercise3$dateTime, exercise3$metering1, xlab = '', ylab='Energy sub metering')
  par(col="black") # plotting symbol and color 
  lines(exercise3$dateTime, exercise3$metering1)
  par(col="blue") # plotting symbol and color 
  lines(exercise3$dateTime, exercise3$metering3)
  par(col="red") # plotting symbol and color 
  lines(exercise3$dateTime, exercise3$metering2)
  par(col="black") # plotting symbol and color 
  legend(x='topright', 'groups', 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), 
         col=c('black','red','blue'))
}

printToPng('figure/plot3.PNG', doThePlotting(dataForPlotting))
