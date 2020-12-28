data<-read.csv2("household_power_consumption.txt")
data<-transform(data, Date = as.Date(Date, format ="%d / %m / %Y"))
Tab<-subset(data,Date<= "2007-02-02" & Date>= "2007-02-01" )
rm(data)

par(mfrow=c(1,1))
png(filename = "Plot2.png")
tab<-transform(Tab, Time = strptime(paste(Time, Date),format = "%H : %M : %S %Y-%m-%d"))
with(tab, plot(y=as.numeric(Global_active_power), x= Time,type='l',xlab = "",
               ylab = "Global Active Power (kilowatts)"))
dev.off()
