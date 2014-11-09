setwd(dirname(parent.frame(2)$ofile))
source('helper.r')

plotname = "../plt/plot1.png"
sqDim = 480
#open png device
png(filename = plotname, width = sqDim, height = sqDim)

#make a histogram of the Global Active Power & make the bars Red
hist(tdf$Global_active_power, 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', 
     col='red')

#closing png device 
dev.off()