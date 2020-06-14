## Loading the libraries I will use
library(data.table)
library(sqldf)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Total emissions by year
TotalEmi <- sqldf("Select year,sum(emissions) from NEI
                  group by year")
##Creating the plot
plot(TotalEmi$year,TotalEmi$`sum(emissions)`,xlab = "Year", ylab="Total emisions (in tons)",main = "PM2.5 Emissions in United States",type="l")

##Saving the plot
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()