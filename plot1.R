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
png(filename = file.path(datapath,"plot1.png"),width=480,height=480)
hist(housepowerdatasub$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)",ylim=c(0,1200))
dev.off()


