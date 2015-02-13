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
png(filename = "plot3.png", 
    width = 480, height = 480)

#send plot into opend device
with(data,plot(Datetime,Global_active_power,type="l"),title(main="",xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()
