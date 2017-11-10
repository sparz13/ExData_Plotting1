## read the two days into the variable electric 
electric <- read.table("household_power_consumption.txt", 
                       header = TRUE, sep=";", skip=66636, nrows = 2880 )

## read in a row just so I could add the headers 

cnames <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep=";", nrows=1 )

## add the column names 

names(electric) <- names(cnames)

## create date 

datetime <- strptime(paste(electric$Date, electric$Time, sep = " "), 
                     "%d/%m/%Y %H:%M:%S")

## create png plot4.png file 

png("plot4.png", width=480, height=480)

## set up parameters 
par(mfrow =c(2,2), bg=NA)

## first plot

plot(datetime, electric$Global_active_power, xlab="", 
            ylab="Global Active Power (kilowatts)", type="l")

## second plot

plot(datetime, electric$Voltage, type="l", ylab="Voltage")

## third plot

plot(datetime, electric$Sub_metering_1, col="black", type="l", 
     ylab="Energy Submetering", xlab="")
lines(datetime, electric$Sub_metering_2, col="red")
lines(datetime, electric$Sub_metertitling_3, col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## fourth plot 

plot(datetime, electric$Global_reactive_power, type="l",
     ylab="Global_reactive_power")
dev.off()