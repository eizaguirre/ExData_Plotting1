#Reads source file and creates a new datetime column 
ihepc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
ihepc$Datetime <- paste(ihepc$Date, ihepc$Time)
ihepc$Datetime <- strptime(ihepc$Datetime, "%d/%m/%Y %H:%M:%S")

#Subsets the data to only include observations from 2007-02-01 and 2007-02-02
ihepc <- subset(ihepc, ihepc$Datetime >= "2007-02-01 00:00:00" & ihepc$Datetime <= "2007-02-02 23:59:59" )

#Creates a line graph with the Global_active_power variable
plot(ihepc$Datetime, as.numeric(ihepc$Global_active_power), xlab="", ylab = "Global Active Power (kilowatts)", type = "l")

#Exports the line graph to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()