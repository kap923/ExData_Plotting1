# Read data from file
data <- read.table("household_power_consumption.txt", sep=';',header=TRUE, stringsAsFactors = FALSE)
dim(data)
# Subset data
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]
dim(SubsetData)
#Datatype conversion
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
DataTime <- paste(SubsetData$Date, SubsetData$Time )
SubsetData$DateTime <- strptime(DataTime, format = "%d/%m/%Y %H:%M:%S" )
#Plot 2
png("plot2.png", width = 480, height = 480)
plot(SubsetData$DateTime,SubsetData$Global_active_power, type="l", xlab ="", ylab = "GLobal Active Power (kilowatts)")
dev.off()