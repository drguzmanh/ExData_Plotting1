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

png(filename = "plot1.png")
hist(dat$Global_active_power,
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()



