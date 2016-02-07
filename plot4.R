# Read Data File
data <- read.table("household_power_consumption.txt", sep=';',header=TRUE, stringsAsFactors = FALSE)
dim(data)
# Create a data subset
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]
dim(SubsetData)
# Type conversion
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
GlobalReActivePower <- as.numeric(SubsetData$Global_reactive_power)
Voltage <- as.numeric(SubsetData$Voltage)
Sub_metering_1 <- as.numeric(SubsetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(SubsetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(SubsetData$Sub_metering_3)
# Formating Dates
DataTime <- paste(SubsetData$Date, SubsetData$Time )
SubsetData$DateTime <- strptime(DataTime, format = "%d/%m/%Y %H:%M:%S" )

#Plot Template
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(SubsetData$DateTime,GlobalActivePower, type="l", xlab ="", ylab = "GLobal Active Power")

plot(SubsetData$DateTime,Voltage, type="l", xlab ="datetime", ylab = "Voltage")

plot(SubsetData$DateTime,SubsetData$Sub_metering_1, type="n", xlab ="", ylab ="Energy sub metering")
# Adding lines to the template
lines(SubsetData$DateTime,SubsetData$Sub_metering_1, col = "black")
lines(SubsetData$DateTime,SubsetData$Sub_metering_2, col = "red")
lines(SubsetData$DateTime,SubsetData$Sub_metering_3, col = "blue")
#Legend
legend("topright",c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),lty = c(1,1,1), lwd = c(2,2,2), col = c("black","red","blue"))

plot(SubsetData$DateTime,GlobalReActivePower, type="l", xlab ="datetime", ylab = "Global_reactive_power")
dev.off()