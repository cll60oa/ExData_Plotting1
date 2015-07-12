#plot1
library(dplyr)
file_ <- read.csv("./household_power_consumption.txt",header = TRUE,sep = ";"
                  , stringsAsFactors=FALSE,na.strings="?")
file_ <- tbl_df(file_)
file_$Date <- as.POSIXct(file_$Date,format = "%e/%m/%Y")

# select data of 2007-02-01 and 2007-02-02
file2_ <- filter(file_, file_$Date == "2007-02-01" | file_$Date == "2007-02-02")

# plot
png(filename="./plot3.png",width = 480, height = 480)
with(file2_, plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",
                  ylim=c(0,max(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(file2_, lines(date_time, Sub_metering_2,col="red",))
with(file2_, lines(date_time, Sub_metering_3,col="blue",))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
