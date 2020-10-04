png(filename = "./plot1.png",height = 480,width = 480)
filename<-"exdata_data_household_power_consumption.zip"
if(!file.exists(filename)){
  file<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(file,filename,method="curl")
}
if(!file.exists("household_power_consumption")){
  unzip(filename)
  
}
data<-read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)
a<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
hist(as.numeric(a$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()