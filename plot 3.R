## Loading the libraries I will use
library(data.table)
library(sqldf)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Total emissions by year
TotalEmi <- sqldf("Select year,type,sum(emissions) from NEI
                    where fips = 24510
                  group by year,type")

##Creating the plot
ggplot(data=TotalEmi, aes(x=TotalEmi$year, y=TotalEmi$`sum(emissions)`, group=type)) +
    geom_line(aes(color=type))+
    geom_point(aes(color=type))+
    labs(y="Total emisions (in tons)",x="Year (1999 - 2008)",title="Emissions for Baltimore City by Type")

##Saving the plot
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
