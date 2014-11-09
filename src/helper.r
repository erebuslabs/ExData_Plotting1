# filename
library(sqldf)
if("lubridate" %in% rownames(installed.packages()) == FALSE) {install.packages("lubridate")}
library(lubridate)
setwd(dirname(parent.frame(2)$ofile))

#variable setup
mURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
mZipDest <- "pd.zip"
mFilename <- "powerdata.rds"
targetFilename <- "household_power_consumption.txt"
sDate <- '1/2/2007'
eDate <- '2/2/2007'

if (!file.exists(mFilename)) {
  #we need to grab the file
  download.file(url = mURL, destfile = mZipDest, method = 'curl', quiet = TRUE)
  unzip(mZipDest)
  fhandle <- file(targetFilename)
  sqlstatement <- sprintf("select * from fhandle where Date = '%s' or Date = '%s'", sDate, eDate) 
  
  tdf <- sqldf(sqlstatement, file.format = list(header=TRUE, sep = ";"))

  close(fhandle)
  tdf[] <- lapply(tdf, function(x){replace(x, x == '?', NA)})
  tdf <- na.omit(object = tdf, )

  tdf$Date <- dmy(tdf$Date)
  tdf$Time <- hms(tdf$Time)
  
  tdf$dts <- tdf$Date + tdf$Time
  
  saveRDS(tdf, file=mFilename)
}else{
  tdf <- readRDS(mFilename)
  
}