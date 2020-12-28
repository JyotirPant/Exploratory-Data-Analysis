data<-read.csv2("household_power_consumption.txt")
data<-transform(data, Date = as.Date(Date, format ="%d / %m / %Y"))
Tab<-subset(data,Date<= "2007-02-02" & Date>= "2007-02-01" )
rm(data)

png(filename = "Plot4.png")
par(mfrow=c(2,2))
tab<-transform(Tab, Time = strptime(paste(Time, Date),format = "%H : %M : %S %Y-%m-%d"))
with(tab, plot(y=as.numeric(Global_active_power), x= Time,type='l',xlab = "", 
               ylab = "Global Active Power"))
with(tab, plot(y=as.numeric(Voltage), x= Time,type="l",ylab = "Voltage",xlab="datetime"))
with(tab, plot(x= Time, y = as.numeric(tab$Sub_metering_1),type= "l",xlab = "",
               ylab = "Energy Sub Metering"))
with(tab,lines(x=Time,y=tab$Sub_metering_2,col="red"))
with(tab,lines(x=Time,y=tab$Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = 1,lwd = 2)
with(tab, plot(y=as.numeric(Global_reactive_power),ylab = "Global_reactive_power", 
               x= Time, type="l",xlab="datetime"))
dev.off()

