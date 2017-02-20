setwd('~/Desktop/Data Science/R Class/Raw')

### Plot 1
x <- read.table("~/Desktop/Data Science/R Class/Raw/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
names(x)
head(x)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
data_sub <- subset(x, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data_sub$GAP <- as.numeric(data_sub$Global_active_power)
date_time <- strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

png( "plot1.png", width=480, height=480)
hist(data_sub$GAP, main = "Global Active Power",  col = "red", xlab = 'Global Active Power (kilowatts)', ylab = 'frequency')
dev.off()


#### Plot 2

png("plot2.png", width=480, height=480)
plot( date_time, as.numeric(data_sub$GAP), type="l", xlab="",
					ylab="Global Active Power (kilowatts)") 
					title("Global Active Power Vs. Time")
dev.off()


#### Plot 3

png("plot3.png", width=480, height=480)
plot(date_time, data_sub$Sub_metering_1,  type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(date_time, data_sub$Sub_metering_3, col = "Blue")
lines(date_time, data_sub$Sub_metering_2, col = "Red")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


#### Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
hist(data_sub$GAP, main = "Global Active Power",  col = "red", xlab = 'Global Active Power (kilowatts)', ylab = 'frequency')

plot( date_time, as.numeric(data_sub$GAP), type="l", xlab="",
					ylab="Global Active Power (kilowatts)") 
					title("Global Active Power Vs. Time")

plot(date_time, data_sub$Sub_metering_1,  type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(date_time, data_sub$Sub_metering_3, col = "Blue")
lines(date_time, data_sub$Sub_metering_2, col = "Red")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(date_time, data_sub$Global_reactive_power, type = "l")
dev.off()


