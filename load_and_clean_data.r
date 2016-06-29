


loadandclean <- function(){
        
#set local working directory
setwd("~/Coursera/Data_Science/04_Exploratory_Data_Analysis/Week1")
datapath <- getwd()


# make sure the sources data folder exists
if (!file.exists('source data')) {
        dir.create('source data')
}

# check to see if the existing tidy data set exists; if not, make it...
if (!file.exists('source data/household_power_consumption.txt')) {
        
        # download the zip file and unzip
        file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        download.file(file.url,destfile='source data/power_consumption.zip')
        unzip('source data/power_consumption.zip',exdir='source data',overwrite=TRUE)
}     

# Offline read of local data using uncompressed data and fread for speed
# Becuase of the way fread works, the data must be uncompressed.


housepowerdata <- fread(file.path(datapath,"source data/household_power_consumption.txt"), sep = ";",na.strings = "?")


# Convert chr data to date format, then extract desired range from  2007-02-01 to 2007-02-02
t1 <- as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
housepowerdata$Date <- as.Date(housepowerdata$Date,format = "%d/%m/%Y")
housepowerdatasub <- housepowerdata[housepowerdata$Date %in% t1:t2]

# remove original dataframe from memory
rm(housepowerdata)

#Posixct is used as strptime was generating errors.  Likely to do with the fact that Date was switched from chr to Date
housepowerdatasub$DateTime <- as.POSIXct(paste(housepowerdatasub$Date,housepowerdatasub$Time),format = "%Y-%m-%d %H:%M:%S")

return(housepowerdatasub)

}