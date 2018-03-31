# Read the downloaded file
powerconsumption  <- read.csv("household_power_consumption.txt", header = 
                                TRUE, sep = ";")

# Create a subset of the data with specified date format
subdata <- subset(powerconsumption, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Create a png file out of the plot generated
png("plot3.png", width=480, height=480) 
plot(subdata$Time,subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
