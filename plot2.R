#### Plot 2

setwd('~/Desktop/Data Science/R Class/Raw')

x <- read.table("~/Desktop/Data Science/R Class/Raw/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
names(x)
head(x)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
data_sub <- subset(x, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$GAP <- as.numeric(data_sub$Global_active_power)
date_time <- strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot( date_time, as.numeric(data_sub$GAP), type="l", xlab="",
					ylab="Global Active Power (kilowatts)") 
					title("Global Active Power Vs. Time")
dev.off()
