setwd(dirname(parent.frame(2)$ofile))
source('helper.r')

plotname = "../plt/plot3.png"
sqDim = 480
#open png device
png(filename = plotname, width = sqDim, height = sqDim)

#make a stacked line chart of the three submetering variables; 
#again using combined date+time variable (dts)
#again no xaxis label
#legend manipulation as well

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

#closing png device 
dev.off()