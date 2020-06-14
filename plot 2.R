## Loading the libraries I will use
library(data.table)
library(sqldf)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Total emissions by year in Baltimore
TotalEmi <- sqldf("Select year,sum(emissions) from NEI
                    where fips = 24510
                  group by year")
##Creating the plot
plot(TotalEmi$year,TotalEmi$`sum(emissions)`,xlab = "Year", ylab="Total emisions (in tons)", main = "PM2.5 Emissions in Baltimore City" ,type ="l")




##Saving the plot
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()