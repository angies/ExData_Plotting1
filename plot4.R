#Reading data source
file<-"./household_power_consumption.txt"
xHeader<-c("Date","Time", "Global_active_power",
           "Global_reactive_power","Voltage", 
           "Global_intensity", "Sub_metering_1",
           "Sub_metering_2","Sub_metering_3")
rowskip<-66637
numrow<-2880
extracData<-read.csv(file,sep=";",header=FALSE,col.names=xHeader,nrows= numrow,skip=rowskip)

#Converting Date and Time columns properly
extracData$Date<-as.Date(extracData$Date,"%d/%m/%Y")
datetime<-strptime(paste(extracData$Date,extracData$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

#Creating and saving a plot
png(filename="plot4.png",width=480, height=480)
par(mfcol = c(2, 2))

#DateTime and Global Active Power graph 1,1
plot(datetime,extracData$Global_active_power,xlab="",
     ylab="Global Active Power",type="n")
lines(datetime,extracData$Global_active_power)

#DateTime and Energy Sub_metering graph 2,1
plot(datetime,extracData$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="n")
lines(datetime,extracData$Sub_metering_1,col="black")
lines(datetime,extracData$Sub_metering_2,col="red")
lines(datetime,extracData$Sub_metering_3,col="blue")
legend("topright", bty="n", pch = "___", col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#DateTime and Voltage graph 1,2
plot(datetime,extracData$Voltage,ylab="Voltage",type="n")
lines(datetime,extracData$Voltage)

#DateTime and Global Reactive Power graph 2,2
plot(datetime,extracData$Global_reactive_power,ylab="Global_reactive_power",type="n")
lines(datetime,extracData$Global_reactive_power)

dev.off()  ## Close the PNG file device

