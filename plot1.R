# Read table
data <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.zip")
data <- unzip('./household_power_consumption.zip', files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
data <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
fdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename = "./plot1.png", width = 480, height = 480, units ='px')
hist(fdata$Global_active_power, col = "red", ylab = "Global Active Poewr (kilowatts)", main ="Global Active Power")
dev.off()
