setwd(dirname(parent.frame(2)$ofile))
source('helper.r')

plotname = "../plt/plot4.png"
sqDim = 480
#open png device
png(filename = plotname, width = sqDim, height = sqDim)

#make a 2x2 plot 
par(mfrow=c(2,2)) #Top Left->Right; Bottom Left->Right

#FYI PUNTING FOR NOW - Saving and retriving plot objects for another time
#TL Plot:

#plot2
plot(tdf$dts, tdf$Global_active_power, 
     xlab='',
     ylab='Global Active Power', 
     type='l')


#new plot
plot(tdf$dts, tdf$Voltage, 
     xlab='datetime',
     ylab='Voltage', 
     type='l')

#plot 3
#set up plot first
#colors in order of sub meter
colors <- c('black','red','blue')
#placeholder for legend text
lgn = NULL

#set the ranges of x and y
xrange <- range(tdf$dts) 
#yrange a slight cheat - would change to itterate over all options
yrange <- range(tdf$Sub_metering_1) 

#create the right plot size
plot(xrange, yrange,
     type='n', 
     xlab='',
     ylab='Energy sub metering' ) 

#add the three submeters to the plot
for(i in 1:3){
  submeter <- sprintf("Sub_metering_%d", i)
  lines( tdf$dts, tdf[, submeter], col=colors[i], type='l')
  lgn = c(lgn, submeter)
}

legend('topright', 
       legend=lgn,
       col=colors, 
       lty='solid')

#plot 4 (new)
plot(tdf$dts, tdf$Global_reactive_power, 
     xlab='datetime',
     ylab='Global_reactive_power', 
     type='l')



#closing png device 
dev.off()