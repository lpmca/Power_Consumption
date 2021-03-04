power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

power <- power[power$Date =="1/2/2007" | power$Date =="2/2/2007",]
## power$Date <- as.Date(power$Date, "%m/%d/%Y")
## power$Time <- strptime(power$Time)

png("plot1.png")

hist(as.numeric(power$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()