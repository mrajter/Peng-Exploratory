mydata= read.csv2("household_power_consumption.txt")

mydata$Time=paste(mydata$Date, mydata$Time, sep=" ")
mydata$Time=strptime(mydata$Time, "%d/%m/%Y %H:%M:%S")

mydata$Date=as.Date(mydata$Date, format="%d/%m/%Y")
mydata=subset(mydata, (Date=="2007-02-01" | Date=="2007-02-02"))

for (i in 3:9) {mydata[,i]=as.numeric(as.character(mydata[,i]))}


png("plot1.png", width = 480, height = 480,units = "px")
hist(mydata$Global_active_power, ylim=c(0,1200), main="Global active power",xlab="Global active power (kilowatts)",col="red")
dev.off()