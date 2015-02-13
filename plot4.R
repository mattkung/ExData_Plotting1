## read data from file

s<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

##trun character into date

$Date<-as.character(s$Date)

s$Date<-as.Date(s$Date, "%d/%m/%Y")

##subset data 
data<-subset(s,Date>="2007-02-01" & Date<="2007-02-02")

Datetime<-paste(data$Date,data$Time,sep=" ")

Datetime<-strptime(Datetime, "%Y-%m-%d %H:%M:%S")

data<-cbind(data,Datetime)



#open device
png(filename = "plot4.png", 
    width = 480, height = 480)

## place plot 2 x 2
#send plot into opend device
par(mfrow = c(2, 2))

with(data,plot(Datetime,Global_active_power,type="l"),main="",xlab="",ylab="Global Active Power",)

with(data,plot(Datetime,Voltage,type="l"),main="",xlab="datetime",)


with(data,plot(Datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(Datetime,Sub_metering_2,col="red"))
with(data,lines(Datetime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

with(data,plot(Datetime,Global_reactive_power,type="l"),main="",xlab="datetime",)

dev.off()
