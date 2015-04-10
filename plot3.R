fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Power.zip")) {download.file(fileUrl,destfile="./Power.zip")}
unzip(zipfile="./Power.zip",exdir="./tempData")

data<-read.table("./tempData/household_power_consumption.txt",na.strings="?", header=FALSE,skip=66637, nrows=2880, sep=";", col.names= c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
x <- paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)
data$datetime<-strptime(x,format="%Y-%m-%d %H:%M:%S")


png("plot3.png", width=480,height=480,units="px")
par(mfrow=c(1,1),mar=c(2,4,2,2))
plot(x<-data$datetime,data[,"Sub_metering_1"],type='l',ylab="Energy sub metering",xlab="")
points(x<-data$datetime,data[,"Sub_metering_2"],type='l',col="red")
points(x<-data$datetime,data[,"Sub_metering_3"],type='l',col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()

