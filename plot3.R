png(filename = "./plot3.png",height = 480,width = 480)
filename<-"exdata_data_household_power_consumption.zip"
if(!file.exists(filename)){
  file<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(file,filename,method="curl")
}
if(!file.exists("household_power_consumption")){
  unzip(filename)
  
}
data<-read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()