#Load the Data
setwd("D:\\Coursera\\Material\\04. Exploratory Data Analysis\\CourseProject")
Data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
head(Data); tail(Data);dim(Data);

#Extract the data only on 2007/2/1 ~ 2007/2/2
Final_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
head(Final_Data); tail(Final_Data);dim(Final_Data);


######Plot4######
par(mfcol=c(2,2))

#4-1
plot(x=strptime(paste(Final_Data$Date,Final_Data$Time),format = "%d/%m/%Y %H:%M:%S"), y=Final_Data$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power")

#4-2
with(Final_Data, plot(x=strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"), y=Sub_metering_1, 
                      type = "n", xlab = "", ylab = "Energy sub metering"))
with(Final_Data, lines(strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"), Sub_metering_1, col = "black"))
with(Final_Data, lines(strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(Final_Data, lines(strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))

legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font=0.8, cex=0.7)

#4-3
plot(x=strptime(paste(Final_Data$Date,Final_Data$Time),format = "%d/%m/%Y %H:%M:%S"), y=Final_Data$Voltage, 
     type = "l", xlab = "datetime", ylab = "Voltage")

#4-4
plot(x=strptime(paste(Final_Data$Date,Final_Data$Time),format = "%d/%m/%Y %H:%M:%S"), y=Final_Data$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Voltage")

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()