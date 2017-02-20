#### Plot 3

setwd('~/Desktop/Data Science/R Class/Raw')

x <- read.table("~/Desktop/Data Science/R Class/Raw/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
names(x)
head(x)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
data_sub <- subset(x, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$GAP <- as.numeric(data_sub$Global_active_power)
date_time <- strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(date_time, data_sub$Sub_metering_1,  type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(date_time, data_sub$Sub_metering_3, col = "Blue")
lines(date_time, data_sub$Sub_metering_2, col = "Red")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
