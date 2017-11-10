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

#create plot 
png("plot2.png", width = 480, height=480)
par(bg = NA)
plot(datetime, electric$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()