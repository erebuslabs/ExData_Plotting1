setwd(dirname(parent.frame(2)$ofile))
source('helper.r')

plotname = "../plt/plot2.png"
sqDim = 480
#open png device
png(filename = plotname, width = sqDim, height = sqDim)

#make a line chart of the Global Active Power; 
#using combined date+time variable (dts)
#(no xaxis label)
plot(tdf$dts, tdf$Global_active_power, 
     xlab='',
     ylab='Global Active Power (kilowatts)', 
     type='l')

#closing png device 
dev.off()