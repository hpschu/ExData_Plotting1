dat <- read.table('household_power_consumption.txt', sep=";", header=T, stringsAsFactors = F)
temp1 <- subset(dat, Date = "01/02/2007")
View(temp1)
Time <- strptime(paste(unlist(dat['Date']), unlist(dat['Time'])), format = "%d/%m/%Y %H:%M:%S")
dat <- dat[,c(-1, -2)] # Remove date and time from the original table
dat <- cbind(Time, dat) # Add combined date+time to data
dat <- subset(dat, Time >= "2007-02-01" & Time < "2007-02-03")

dat['Global_active_power']
active_power <- unlist(dat['Global_active_power'])
active_power <- as.double(as.vector(active_power))
active_power <- na.omit(active_power) # Omit na's

# Open device & write
png('plot1.png', width = 480, height = 480)
hist(active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()
