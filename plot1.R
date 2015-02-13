## read data from file

s<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

##trun character into date

$Date<-as.character(s$Date)

s$Date<-as.Date(s$Date, "%d/%m/%Y")

##subset data 
data<-subset(s,Date>="2007-02-01" & Date<="2007-02-02")


#open device
png(filename = "plot1.png", 
    width = 480, height = 480)
hist(data$Global_active_power, main="Globar Active Power", xlab="Global Active Power (kilowatts)",col="red")

dev.off()