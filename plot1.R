
#Reading data source
file<-"./household_power_consumption.txt"
xHeader<-c("Date","Time", "Global_active_power",
           "Global_reactive_power","Voltage", 
           "Global_intensity", "Sub_metering_1",
           "Sub_metering_2","Sub_metering_3")
numrow<-2880
rowskip<-66637
extracData<-read.csv(file,sep=";",header=FALSE,
            col.names=xHeader,nrows= numrow,skip=rowskip)

#Constructing a plot, first to the screen device then to the png device
hist(extracData$Global_active_power,breaks=13,col="red", 
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png") 
dev.off()  ## Close the PNG file device