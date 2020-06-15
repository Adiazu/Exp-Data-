## Loading the libraries I will use
library(data.table)
library(sqldf)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Total emissions by year
TotalEmi <- NEI[which(NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]

##Creating the plot
g<-ggplot(TotalEmi,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Total emisions (in tons)",x="Year (1999 - 2008)",title="Emissions from coal combustion-related sources")

##Saving the plot
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

