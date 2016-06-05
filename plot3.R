# May 27 2016 @ DS
#
# Read the data. 
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Subset for Baltimore city
NEIss_city<-NEI[NEI$fips=='24510',]
# Use aggregate to collect 'mean emissions' over type and year

Mat<-aggregate(Emissions~year+type,NEIss_city,mean)


p<-ggplot(Mat,aes(year,Emissions,col=type,shape=type))+geom_point(size=5, alpha=I(0.65))+stat_smooth(lty=2)
p+xlim(c(1999,2008))+ylab("Mean Emissions (by type)")+
  annotate("text",x=2003.5,y=90,label="All source types show a decrease in Emissions")+
  ggtitle("Change in mean emmisions by source type for Baltimore City")
ggsave(file="plot3.png", limitsize=FALSE)
#

#

