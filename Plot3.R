data<-read.csv2("household_power_consumption.txt")
data<-transform(data, Date = as.Date(Date, format ="%d / %m / %Y"))
Tab<-subset(data,Date<= "2007-02-02" & Date>= "2007-02-01" )
rm(data)

par(mfrow=c(1,1))
png(filename = "Plot3.png")
tab<-transform(Tab, Time = strptime(paste(Time, Date),format = "%H : %M : %S %Y-%m-%d"))
with(tab, plot(x= Time, y = as.numeric(tab$Sub_metering_1),type= "l",xlab = "",
               ylab = "Energy Sub Metering"))
with(tab,lines(x=Time,y=tab$Sub_metering_2,col="red"))
with(tab,lines(x=Time,y=tab$Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty = 1,lwd = 2)
dev.off()
