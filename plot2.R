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

png('plot2.png', width = 480, height = 480)
plot(dat$Time, dat$Global_active_power, type = 'l', ylab='Global Active Power (kilowatts)', xlab="")
dev.off()
