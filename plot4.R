dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

date<-as.Date(as.character(dat$Date), format = "%d/%m/%Y")
d<-c("2007-02-01", "2007-02-02")
i1<-which(date==d[1])
i2<-which(date==d[2])
index<-which(date==d[1] | date==d[2])

data<-data.frame(GlobalActivePower=dat[index,3], Sub_metering_1=dat[index,7], Sub_metering_2=dat[index,8], Sub_metering_3=dat[index,9], Voltage=dat[index,5], GlobalReactivePower=dat[index,4])

for(i in 1:6){
  data[,i]<-as.character(data[,i])
  data[,i]<-as.numeric(data[,i])
}

png("plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))

plot(1:length(data[,1]), data[,1], xaxt="n", xlab="", ylab="Global Active Power", type="l")
axis(side=1, at=c(1,length(i1)+1,length(index)+1), labels=c("Thu","Fri","Sat"))

plot(1:length(data[,2]), data[,2], xaxt="n", xlab="", ylab="Energy sub metering", type="l", col="black")
lines(1:length(data[,3]), data[,3], xaxt="n", col="red")
lines(1:length(data[,4]), data[,4], xaxt="n", col="blue")
axis(side=1, at=c(1,length(i1)+1,length(index)+1), labels=c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lwd=1, col=c("black", "red","blue"))

plot(1:length(data[,5]), data[,5], xaxt="n", xlab="datetime", ylab="Voltage", type="l")
axis(side=1, at=c(1,length(i1)+1,length(index)+1), labels=c("Thu","Fri","Sat"))

plot(1:length(data[,6]), data[,6], xaxt="n", xlab="datetime", ylab="Global_reactive_power", type="l")
axis(side=1, at=c(1,length(i1)+1,length(index)+1), labels=c("Thu","Fri","Sat"))

dev.off()