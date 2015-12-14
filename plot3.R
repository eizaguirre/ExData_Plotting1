#The function reads the source file and creates a new datetime variable 
ihepc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
ihepc$Datetime <- paste(ihepc$Date, ihepc$Time)
ihepc$Datetime <- strptime(ihepc$Datetime, "%d/%m/%Y %H:%M:%S")

#Subset of data that includes observations from 2007-02-01 and 2007-02-02
ihepc <- subset(ihepc, ihepc$Datetime >= "2007-02-01 00:00:00" & ihepc$Datetime <= "2007-02-02 23:59:59" )

#Line graph with the variables: Sub_metering_1, Sub_metering_2, Sub_metering_3
plot(ihepc$Datetime, as.numeric(ihepc$Sub_metering_1), xlab="", ylab = "Energy sub metering", type = "l")
points(ihepc$Datetime, as.numeric(ihepc$Sub_metering_2), col = "Red", type = "l")
points(ihepc$Datetime, as.numeric(ihepc$Sub_metering_3), col = "Blue", type = "l")


#Adds the Legend of the Graph
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5),
        col = c("Black","Red","Blue"), text.width=60000)

#Exports the graph to a PNG file
dev.copy(png, file = "plot3.png")
dev.off()