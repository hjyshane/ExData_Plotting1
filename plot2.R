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

png(filename = "./plot2.png", width = 480, height = 480, units ='px')
plot(x = datetime, y = fdata$Global_active_power, type = "l", xlab = NULL, ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis.POSIXct(1, at = day_ticks, format = "%a")
dev.off()
