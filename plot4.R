Sys.setlocale("LC_TIME", "C")

mydata= read.csv2("household_power_consumption.txt")

mydata$Time=paste(mydata$Date, mydata$Time, sep=" ")
mydata$Time=strptime(mydata$Time, "%d/%m/%Y %H:%M:%S")


mydata$Date=as.Date(mydata$Date, format="%d/%m/%Y")
mydata=subset(mydata, (Date=="2007-02-01" | Date=="2007-02-02"))

for (i in 3:9) {mydata[,i]=as.numeric(as.character(mydata[,i]))}

png("plot4.png", width = 480, height = 480,units = "px")
par(mfrow=c(2,2))
plot(mydata$Time,mydata$Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")

plot(mydata$Time,mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(mydata$Time,mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mydata$Time,mydata$Sub_metering_2, type="l", col="red")
lines(mydata$Time,mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red","blue"), bty = "n")

plot(mydata$Time,mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()