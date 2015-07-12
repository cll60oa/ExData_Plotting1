#plot1
library(dplyr)
file_ <- read.csv("./household_power_consumption.txt",header = TRUE,sep = ";"
                  , stringsAsFactors=FALSE,na.strings="?")
file_ <- tbl_df(file_)
file_$Date <- as.POSIXct(file_$Date,format = "%e/%m/%Y")

# select data of 2007-02-01 and 2007-02-02
file2_ <- filter(file_, file_$Date == "2007-02-01" | file_$Date == "2007-02-02")
file2_ <- mutate(file2_, date_time = as.POSIXct(paste(Date,Time)))

# plot
png(filename="./plot2.png",width = 480, height = 480)
with(file2_, plot(date_time, Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()

