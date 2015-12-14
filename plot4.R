#Reads source file and creates a new datetime column 
ihepc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
ihepc$Datetime <- paste(ihepc$Date, ihepc$Time)
ihepc$Datetime <- strptime(ihepc$Datetime, "%d/%m/%Y %H:%M:%S")

#Subsets the data to only include observations from 2007-02-01 and 2007-02-02
ihepc <- subset(ihepc, ihepc$Datetime >= "2007-02-01 00:00:00" & ihepc$Datetime <= "2007-02-02 23:59:59" )

#Creates 4 containers on the screen 
par(mfrow = c(2,2))

#Creates the First graph with the Global_active_power variable
plot(ihepc$Datetime, as.numeric(ihepc$Global_active_power), xlab="", ylab = "Global Active Power", type = "l",
     cex.lab=0.8)

#Creates the Second graph with the Voltage variable
plot(ihepc$Datetime, as.numeric(ihepc$Voltage), xlab="datetime", ylab = "Voltage", type = "l", cex.lab=0.8)

#Creates the Third line graph with the variables: Sub_metering_1, Sub_metering_2, Sub_metering_3
plot(ihepc$Datetime, as.numeric(ihepc$Sub_metering_1), xlab="", ylab = "Energy sub metering", type = "l", cex.lab=0.8)
points(ihepc$Datetime, as.numeric(ihepc$Sub_metering_2), col = "Red", type = "l")
points(ihepc$Datetime, as.numeric(ihepc$Sub_metering_3), col = "Blue", type = "l")

#Adds the Legend of the Graph
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5),
       col = c("Black","Red","Blue"), bty = "n", pt.cex = 1, cex=0.6, text.width=70000)

#Creates the Forth line graph with the variable Global_reactive_power
plot(ihepc$Datetime, as.numeric(ihepc$Global_reactive_power), xlab="datetime", ylab = "Global_reactive_power",
     type = "l", cex.lab=0.8)

#Exports all four graphs to a PNG file
dev.copy(png, file = "plot4.png")
dev.off()