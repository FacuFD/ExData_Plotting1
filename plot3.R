getwd() ### Get working directory and ensure it contains the desired zip file

unzip("exdata_data_household_power_consumption") ### unzip the desired zip file

dat1 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", ### Read the data from the text file into an object
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

str(dat1) ### Take a look at the data

dat2<-subset(dat1, Date %in% c("1/2/2007","2/2/2007")) ### Extract the desired data from the master file

#?as.POSIXct() ### Look up requirements 

#?strptime() ### Look up requirements 

days<-strptime(paste(dat2$Date, dat2$Time, sep=" "), ### Put the date and time date of our desired data into the "days" object
               "%d/%m/%Y %H:%M:%S") ### This format allows it to be read properly by as.POSIXct

dat2$Days<-as.POSIXct(days) ### Conver object (date and time) into the desired class and store it in a new column called "Days"

#View(dat2) ### Look at the data




plot(dat2$Sub_metering_1~dat2$Days, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(dat2$Sub_metering_2~dat2$Days,col='Red')
lines(dat2$Sub_metering_3~dat2$Days,col='Blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2, col = c("black","red","blue")) 


dev.copy(png, file="plot3.png", height=480, width=480)

dev.off() ### This shuts down the current device and closes any previous figure files.

