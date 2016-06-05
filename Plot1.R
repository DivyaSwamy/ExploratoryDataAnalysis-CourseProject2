# May 16 2016 @ DS
#
# Read the data. 
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

x<-unique(NEI$year)

yval<-with(NEI,tapply(Emissions, year, sum))

# Plot
png('plot1.png',width=480,height = 480)
par(mar=c(4,4,2,1))
plot(x,yval,type='l',lty=3,
     lwd=2.5,col="blue",xlab='Year',
     ylab='Total PM2.5 Emission', 
     main='Change in PM2.5 over time (All Unites States)')
points(x,yval,pch=5,cex=2, lwd=2)
dev.off()

