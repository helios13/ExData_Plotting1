dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

date<-as.Date(as.character(dat$Date), format = "%d/%m/%Y")
d<-c("2007-02-01", "2007-02-02")
index<-which(date==d[1] | date==d[2])

data<-data.frame(Date=dat[index,1], GlobalActivePower=dat[index,3])

data[,2]<-as.character(data[,2])
data[,2]<-as.numeric(data[,2])

png("plot1.png", width=480, height=480, units="px")

hist(data[,2], xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()