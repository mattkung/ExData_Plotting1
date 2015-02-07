s<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

$Date<-as.character(s$Date)

s$Date<-as.Date(s$Date, "%d/%m/%Y")

data<-subset(s,Date>="2007-02-01" & Date<="2007-02-02")

hist(data$Global_active_power, main="Globar Active Power", xlab="Global Active Power (kilowatts)",col="red")