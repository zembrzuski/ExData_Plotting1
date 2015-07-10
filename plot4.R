source('utils.R')

# read the file
data <- readFile('input-data/household_power_consumption.txt')

# adding typed time and date to the matrix
data2 <- cbind(data, date_time = convertStringToDateTime(paste(data$Date, data$Time, sep = ' ')))

# filtering dates between 02/01 and 02/02
data3 <- subset(data2, isDateBetween('01/02/2007 00:00:00', '02/02/2007 23:59:59', date_time))

globalActivePowerData <- data.frame(
  dateTime = data3$date_time, 
  measure = as.numeric(as.character(data3$Global_active_power))
)

submeteringDataFrame <- data.frame(
  dateTime = data3$date_time,
  metering1 = as.numeric(as.character(data3$Sub_metering_1)),
  metering2 = as.numeric(as.character(data3$Sub_metering_2)),
  metering3 = as.numeric(as.character(data3$Sub_metering_3))
)

doThePlotting <- function(globalPower, submetering) {
  par(mfrow=c(2,2))
  par(pch=0, col="white") # plotting symbol and color 
  plot(globalPower$dateTime, globalPower$measure, ylab = 'Global Activite Power', xlab = '')
  par(pch=0, col="black") # plotting symbol and color 
  lines(globalPower$dateTime, globalPower$measure)	
  
  par(pch=0, col="white") # plotting symbol and color 
  plot(globalPower$dateTime, as.numeric(as.character(data3$Voltage)), ylab = 'Voltage', xlab = 'datetime')
  par(pch=0, col="black") # plotting symbol and color 
  lines(globalPower$dateTime, as.numeric(as.character(data3$Voltage)))

  par(col="white") # plotting symbol and color 
  plot(submetering$dateTime, submetering$metering1, ylab = 'Energy sub metering', xlab = '')
  par(col="black") # plotting symbol and color 
  lines(submetering$dateTime, submetering$metering1)
  par(col="blue") # plotting symbol and color 
  lines(submetering$dateTime, submetering$metering3)
  par(col="red") # plotting symbol and color 
  lines(submetering$dateTime, submetering$metering2)
    
  par(pch=0, col="white") # plotting symbol and color 
  plot(globalPower$dateTime, as.numeric(as.character(data3$Global_reactive_power)), ylab = 'Global reactive power', xlab = 'datetime')
  par(pch=0, col="black") # plotting symbol and color 
  lines(globalPower$dateTime, as.numeric(as.character(data3$Global_reactive_power)))
}
  
printToPng('figure/plot4.PNG', doThePlotting(globalActivePowerData, submeteringDataFrame))
