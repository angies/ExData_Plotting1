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
DateTime<-strptime(paste(extracData$Date,extracData$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

#Creating and saving a plot
png(filename="plot2.png",width=480, height=480)
plot(DateTime,extracData$Global_active_power,xlab="",
     ylab="Global Active Power (kilowatts)",type="n")
lines(DateTime,extracData$Global_active_power)
dev.off()  ## Close the PNG file device

