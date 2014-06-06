## Project 1, Plot 2 Exploring Data 003

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
plot(hpc[,10],hpc[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(hpc[,10],hpc[,3], type="l")
## save the plot to file
png(filename = "./figure/plot2.png",width = 480, height = 480, units = "px", pointsize = 12)
plot(hpc[,10],hpc[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(hpc[,10],hpc[,3], type="l")
dev.off()