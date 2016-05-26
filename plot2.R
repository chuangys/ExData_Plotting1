#Load the Data
setwd("D:\\Coursera\\Material\\04. Exploratory Data Analysis\\CourseProject")
Data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
head(Data); tail(Data);dim(Data);

#Extract the data only on 2007/2/1 ~ 2007/2/2
Final_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
head(Final_Data); tail(Final_Data);dim(Final_Data);


######Plot2######
#strptime(paste(Final_Data$Date[1:3],Final_Data$Time[1:3]),format = "%d/%m/%Y %H:%M:%S")
#weekdays(as.Date(Final_Data$Date[1:3],"%d/%m/%Y"))
#?weekdays
#?as.Date
plot(x=strptime(paste(Final_Data$Date,Final_Data$Time),format = "%d/%m/%Y %H:%M:%S"), y=Final_Data$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()