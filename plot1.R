## read the two days into the variable electric 
electric <- read.table("household_power_consumption.txt", 
                       header = TRUE, sep=";", skip=66636, nrows = 2880 )

## read in a row just so I could add the headers 

cnames <- read.table("household_power_consumption.txt", 
                     header = TRUE, sstep=";", nrows=1 )

## add the column names 

names(electric) <- names(cnames)

## created png file 
png("plot1.png", width = 480, height = 480)

## add transperency to background color
par(bg=NA)

hist(electric$Global_active_power, main = "Global Active Power", 
       col ="red", xlab="Global Active Power (kilowatts)" )
dev.off()