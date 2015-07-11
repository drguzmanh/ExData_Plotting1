#Exploratory Data Analysis
#Assigment 1


# grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
# 66638
dat = read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";")

datnames <- read.table("household_power_consumption.txt", 
                      nrows = 1, sep = ";", stringsAsFactors=F)
names(dat) <- datnames
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$Time <- strptime(dat$Time, "%H:%M:%S")

png(filename = "plot2.png")
plot(dat$Global_active_power, type = "l", 
    xlab ="", ylab="Global Active Power (kilowatts)" ,frame.plot = T, axes = F)
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 2, 4, 6))
dev.off()



