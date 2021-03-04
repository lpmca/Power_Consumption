power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

power <- power[power$Date =="1/2/2007" | power$Date =="2/2/2007",]
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(strptime(power$Time, format = "%H:%M:%S"),"%H:%M:%S")

power<-mutate(power, Real_Time = as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))


png("plot3.png")

plot(power$Real_Time,power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power, lines(Real_Time, as.numeric(Sub_metering_1)))
with(power, lines(Real_Time, as.numeric(Sub_metering_2),col="red"))
with(power, lines(Real_Time, as.numeric(Sub_metering_3),col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

dev.off()