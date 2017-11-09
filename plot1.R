## read the two days into the variable electric 
electric <- read.table("household_power_consumption.txt", 
                       header = TRUE, sep=";", skip=66636, nrows = 2880 )

## read in a row just so I could add the headers 

cnames <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep=";", nrows=1 )

## add the column names 

names(electric) <- names(cnames)

## switched first row to a date class

electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

#created histogram 

hist(electric$Global_active_power, main = "Global Active Power", 
       col ="red", xlab="Global Active Power (kilowatts)",
       ylim = c(0,1200))