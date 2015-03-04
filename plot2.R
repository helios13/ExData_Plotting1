dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

date<-as.Date(as.character(dat$Date), format = "%d/%m/%Y")
d<-c("2007-02-01", "2007-02-02")
i1<-which(date==d[1])
i2<-which(date==d[2])
index<-which(date==d[1] | date==d[2])

data<-data.frame(Date=dat[index,1], GlobalActivePower=dat[index,3])

data[,2]<-as.character(data[,2])
data[,2]<-as.numeric(data[,2])

png("plot2.png", width=480, height=480, units="px")

plot(1:length(data[,2]), data[,2], xaxt="n", xlab="", ylab="Global Active Power (kilowatts)", type="l")

axis(side=1, at=c(1,length(i1)+1,length(index)+1), labels=c("Thu","Fri","Sat"))

dev.off()