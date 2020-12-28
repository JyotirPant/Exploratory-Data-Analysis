data<-read.csv2("household_power_consumption.txt")
data<-transform(data, Date = as.Date(Date, format ="%d / %m / %Y"))
rm(data)
Tab<-subset(data,Date<= "2007-02-02" & Date>= "2007-02-01" )

par(mfrow=c(1,1))
png(filename = "Plot1.png")
with(Tab, hist(as.numeric(Global_active_power), col ="red",main= "Global Active Power"
               ,xlab = "Global Active Power (kilowatts)"))
dev.off()
