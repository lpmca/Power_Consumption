power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

power <- power[power$Date =="1/2/2007" | power$Date =="2/2/2007",]
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(strptime(power$Time, format = "%H:%M:%S"),"%H:%M:%S")

power<-mutate(power, Real_Time = as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))

png("plot2.png")

with(power, plot(Real_Time,as.numeric(Global_active_power),type="l"))
title(xlab="",main="Global Active Power Vs Time",ylab="Global Active Power (kilowatts)")

dev.off()