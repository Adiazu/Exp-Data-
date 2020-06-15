## Loading the libraries I will use
library(data.table)
library(sqldf)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Total emissions by year
TotalEmi<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] & NEI$fips=="24510"),]

##Creating the plot
g<-ggplot(TotalEmi,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Total emisions (in tons)",x="Year (1999 - 2008)",title="Emissions from motor vehicle for Baltimore City")

##Saving the plot
dev.copy(png,"plot5.png", width=480, height=480)
dev.off()