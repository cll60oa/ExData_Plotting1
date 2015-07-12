#plot1
library(dplyr)
file_ <- read.csv("./household_power_consumption.txt",header = TRUE,sep = ";"
                , stringsAsFactors=FALSE,na.strings="?")
file_ <- tbl_df(file_)
file_$Date <- as.POSIXct(file_$Date,format = "%e/%m/%Y")

# select data of 2007-02-01 and 2007-02-02
file2_ <- filter(file_, file_$Date == "2007-02-01" | file_$Date == "2007-02-02")

# plot
png(filename="./plot1.png",width = 480, height = 480)
hist(file2_$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
