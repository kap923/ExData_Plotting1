# read data from file
data <- read.table("household_power_consumption.txt", sep=';',header=TRUE, stringsAsFactors = FALSE)
dim(data)
# Generate subset
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]
dim(SubsetData)
# Change datatype
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
#Plot 1
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col="red", xlab = "GLobal Active Power (kilowatts)", main = "Global Active Power")
dev.off()



