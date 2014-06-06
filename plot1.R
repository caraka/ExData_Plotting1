## Project 1, Plot 1 Exploring Data 003

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

## create the plot onscreen
hist(hpc[,3], xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
## save the plot to file
png(filename = "./figure/plot1.png",width = 480, height = 480, units = "px", pointsize = 12)
hist(hpc[,3], xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()