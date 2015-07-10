#
# This fie contains functions that are useful by many functions.
#

# Receives the path for reading a csv file and returns the data corresponding to the input.
readFile <- function(filePath) {
  read.csv(filePath, sep = ';')
}

# this function should be used to save to a graphic into a png file
printToPng <- function(filePath, theGraphic) {
  par(mar=c(0,0,0,0))
  png(filePath, width = 480, height = 480, units = 'px')
  theGraphic
  dev.off()
}

# Convert a String in the format 'dd/MM/YYYY HH:MM:SS' to a dateTime
convertStringToDateTime <- function(string) {
  strptime(string, '%d/%m/%Y %H:%M:%S')
}

    
    
# Receives a string with the initial date, a string with the final date
# and returns a boolean saying if the date_time is in the range between the
# initialDateString and finalDateString
isDateBetween <- function(initialDateString, finalDateString, date_time) {
  date_time >= convertStringToDateTime(initialDateString) & date_time <= convertStringToDateTime(finalDateString)  
}

