getwd() ### Get working directory and ensure it contains the desired zip file

unzip("exdata_data_household_power_consumption") ### unzip the desired zip file

dat1 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", ### Read the data from the text file into an object
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

str(dat1) ### Take a look at the data

dat2<-subset(dat1, Date %in% c("1/2/2007","2/2/2007")) ### Extract the desired dates
             
dat2$Date<-as.Date(dat2$Date, "%d%m%y") ### Ensure that the desired dates are read as "dates" by R

str(dat2) ### Look at the subsetted data

with(dat2,hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ### Create histogram and label everything
               ylab = "Frequency", col="red", main="Global Active Power"))

?png ### Look up requirements for png 

dev.copy(png, "plot1.png",width = 480, height = 480)

dev.off() ### This shuts down the current device and closes any previous figure files.


