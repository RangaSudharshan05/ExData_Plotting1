png(filename = "./plot2.png",height = 480,width = 480)
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
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()