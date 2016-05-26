#Load the Data
setwd("D:\\Coursera\\Material\\04. Exploratory Data Analysis\\CourseProject")
Data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
head(Data); tail(Data);dim(Data);

#Extract the data only on 2007/2/1 ~ 2007/2/2
Final_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
head(Final_Data); tail(Final_Data);dim(Final_Data);


######Plot1######
hist(Final_Data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()