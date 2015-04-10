fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Power.zip")) {download.file(fileUrl,destfile="./Power.zip")}
unzip(zipfile="./Power.zip",exdir="./tempData")

data<-read.table("./tempData/household_power_consumption.txt", header=FALSE,skip=66637, nrows=2880, sep=";", col.names= c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
x <- paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)
data$datetime<-strptime(x,format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1),mar=c(2,4,2,2))
plot(y=data$Global_active,x=data$datetime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",width=480, height=480, units="px")
dev.off()

