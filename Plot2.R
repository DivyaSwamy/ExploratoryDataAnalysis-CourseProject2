# May 27 2016 @ DS
#
# Read the data. 
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

# Subset for Baltimore city
NEIss_city<-NEI[NEI$fips=='24510',]
#
x<-unique(NEIss_city$year)
#
yval<-with(NEIss_city,tapply(Emissions,year,sum))
#
png('plot2.png',height=480, width=480)
par(mar=c(4,4,2,1))
plot(x,yval,type='l',
     lwd=2.5,col="red",lty=4,xlab='Year',
     ylab='Total PM2.5 Emissions',
     main='Change in total PM2.5 with time in Baltomore City')
points(x,yval,pch=7,cex=2,col='black')
dev.off()
