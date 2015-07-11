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

png(filename = "plot3.png")
plot(dat$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     type = "l", axes = FALSE, frame.plot = TRUE)
lines(dat$Sub_metering_2, col="red")
lines(dat$Sub_metering_3, col="blue")
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 10, 20, 30))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col=c("black", "red", "blue"))
dev.off()



