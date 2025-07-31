# Read table
data <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.zip")
data <- unzip('./household_power_consumption.zip', files = NULL, list = FALSE, overwrite = TRUE,
              junkpaths = FALSE, exdir = ".", unzip = "internal",
              setTimes = FALSE)
data <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
fdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# date convert
Sys.setlocale("LC_TIME", "English")
datetime <- as.POSIXct(paste(fdata[,1], fdata[,2]), format = "%d/%m/%Y %H:%M:%S")
day_ticks <- seq(from = as.POSIXct("2007-02-01"), to = as.POSIXct("2007-02-03"), by = "day")

png(filename = "./plot4.png", width = 480, height = 480, units ='px')
par(mfrow = c(2,2))
plot(datetime, fdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts", type = "l", xaxt = "n")
axis.POSIXct(1, at = day_ticks, format = "%a")
plot(datetime, fdata$Voltage, xlab = "datetime", ylab = "Volatage", , xaxt = "n", type = "l")
axis.POSIXct(1, at = day_ticks, format = "%a")
plot(datetime, fdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", , xaxt = "n")
axis.POSIXct(1, at = day_ticks, format = "%a")
lines(datetime, fdata$Sub_metering_2, col = "red")
lines(datetime, fdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
plot(datetime, fdata$Global_reactive_power, xlab = "", ylab = "Global_reactive_power", type  = "l", xaxt = "n")
axis.POSIXct(1, at = day_ticks, format = "%a")
dev.off()
