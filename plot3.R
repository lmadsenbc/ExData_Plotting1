# Desciption 
# Script to generate plot1.png for assignement 1

# required packages
library(data.table)
library(lubridate)
library(chron)

#set local working directory
setwd("~/Coursera/Data_Science/04_Exploratory_Data_Analysis/Week1")
datapath <- getwd()

#Call script to download and load data 
source('load_and_clean_data.r')

housepowerdatasub <- loadandclean()

#create the graph specified in the assignment
png(filename = file.path(datapath,"plot3.png"),width=480,height=480)

linecol <- c("black","red","blue")
labels<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(housepowerdatasub$DateTime,housepowerdatasub$Sub_metering_1,type="l",col=linecol[1],xlab="",ylab = "Energy sub metering")
lines(housepowerdatasub$DateTime,housepowerdatasub$Sub_metering_2,col=linecol[2])
lines(housepowerdatasub$DateTime,housepowerdatasub$Sub_metering_3,col=linecol[3])

# Add legend
legend("topright",legend = labels,col = linecol,lty = "solid")

dev.off()


