## Loading the libraries I will use
library(data.table)
library(sqldf)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Total emissions by year
NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
tco <- c("24510","06037")
NEI_motorvehicle_both<-subset(NEI_motorvehicle,fips %in% tco)

##Creating the plot
g<-ggplot(NEI_motorvehicle_both,aes(year,Emissions,color=fips))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Los Angeles and Baltimore City",x="Year (1999 - 2008)")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))

##Saving the plot
dev.copy(png,"plot6.png", width=480, height=480)
dev.off()