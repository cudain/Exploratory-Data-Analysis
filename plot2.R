## Get all full table
full_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')
full_table$Date <- as.Date(full_table$Date, format="%d/%m/%Y")

## Read subset table
plot_data <- subset(full_table, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_table) ##clear full_table

## Converts dates
date_time <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$Datetime <- as.POSIXct(date_time)

## Plot 2
plot(data$Global_active_power~data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saves data to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()