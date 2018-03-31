# Read the downloaded file
powerconsumption  <- read.csv("household_power_consumption.txt", header = 
                                TRUE, sep = ";")

# Create a subset of the data with specified date format
subdata <- subset(powerconsumption, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Create a png file from the generated plot
png("plot2.png", width=480, height=480) 
plot(subdata$Time,as.numeric(as.character(subdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
