dat <- read.table('household_power_consumption.txt', sep=";", header=T, as.is = T)
#Time <- strptime(paste(unlist(dat['Date']), unlist(dat['Time'])), format = "%d/%m/%Y %H:%M:%S")
#dat <- dat[,c(-1, -2)] # Remove date and time from the original table
#dat <- cbind(Time, dat) # Add combined date+time to data

dat <- transform(dat, Date = as.Date(Date, format = "%d/%m/%Y"))
dat <- transform(dat, Time = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))
dat <- transform(dat, Global_active_power = as.double(Global_active_power))
dat <- transform(dat, Global_reactive_power = as.double(Global_reactive_power))
dat <- transform(dat, Voltage = as.double(Voltage))
dat <- subset(dat, Date > "2007-01-31" & Date < "2007-02-03")

par(mfrow = c(2,2))
par(cex = 0.6)

plot(dat$Time, dat$Global_active_power, type = 'l', ylab='Global Active Power', xlab="")

plot(dat$Time, dat$Voltage, type = 'l', ylab = 'Voltage', xlab = "datetime")

plot(dat$Time, dat$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = "")
lines(dat$Time, dat$Sub_metering_2, type = 'l', col = 'red')
lines(dat$Time, dat$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1, bty = "n")

plot(dat$Time, dat$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = "datetime")

dev.copy(device = png, width = 480, height = 480, filename='plot4.png')
dev.off()
