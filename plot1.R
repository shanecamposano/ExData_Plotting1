# Read the downloaded file
powerconsumption  <- read.csv("household_power_consumption.txt", header = 
                     TRUE, sep = ";")

# Create a subset of the data with specified date format
subdata <- subset(powerconsumption, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

# Create a png file from the generated histogram of the subset
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
