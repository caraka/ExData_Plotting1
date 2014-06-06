## Project 1, Plot 3 Exploring Data 003

## create a custom colClass to fix the date, from:
## http://stackoverflow.com/questions/13022299/specify-date-format-for-colclasses-argument-in-read-table-read-csv
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
## fix the data location
fileurl <- "~/Documents/DataScience/ExploreData/week1/household_power_consumption.txt"
## import the data
classy <- c("myDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpcraw <- read.table(fileurl, header=TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE,colClasses = classy)
## subset the data and clear the memory of the big set
hpc <- hpcraw[hpcraw$Date == "2007-02-01" | hpcraw$Date ==  "2007-02-02",]
hpcraw <- NULL

## Create a DateTime column for the ts plot
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time),format="%Y-%m-%d %H:%M:%S")

## create the plot onscreen
par(mfcol = c(2, 2))

plot(hpc[,10],hpc[,3], type="n", xlab="", ylab="Global Active Power")
lines(hpc[,10],hpc[,3], type="l")

plot(hpc[,10],hpc[,7], type="n", xlab="", ylab="Energy sub metering")
lines(hpc[,10],hpc[,7], type="l", col="black")
lines(hpc[,10],hpc[,8], type="l", col="red")
lines(hpc[,10],hpc[,9], type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty='n', cex=.75)

plot(hpc[,10],hpc[,5], type="n", xlab="datetime", ylab="Voltage")
lines(hpc[,10],hpc[,5], type="l")

plot(hpc[,10],hpc[,4], type="n", xlab="datetime", ylab="Global_reactive_power")
lines(hpc[,10],hpc[,4], type="l")

## save the plot to file
png(filename = "./figure/plot4.png",width = 480, height = 480, units = "px", pointsize = 10)
par(mfcol = c(2, 2))

plot(hpc[,10],hpc[,3], type="n", xlab="", ylab="Global Active Power")
lines(hpc[,10],hpc[,3], type="l")

plot(hpc[,10],hpc[,7], type="n", xlab="", ylab="Energy sub metering")
lines(hpc[,10],hpc[,7], type="l", col="black")
lines(hpc[,10],hpc[,8], type="l", col="red")
lines(hpc[,10],hpc[,9], type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty='n', cex=.75)

plot(hpc[,10],hpc[,5], type="n", xlab="datetime", ylab="Voltage")
lines(hpc[,10],hpc[,5], type="l")

plot(hpc[,10],hpc[,4], type="n", xlab="datetime", ylab="Global_reactive_power")
lines(hpc[,10],hpc[,4], type="l")

dev.off()