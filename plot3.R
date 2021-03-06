setwd("W:/AlenaVS/dataAnalysis/Coursera/ExpDAn")

####### Loading data
# Calculating memory usage: #row * #columns * 8 / 2^20 or approximately 145 Mb
# So I decided to load the two-day portion of data. 
# Dataset is unzipped and stored in working directory

colNames <-  names(read.table("household_power_consumption.txt", 
                                 sep = ";", nrows = 1, header = T))
data <- read.table("household_power_consumption.txt", sep = ";", 
              na.strings = "?", stringsAsFactors = F,
              col.names = colNames,
              skip = 66637, nrows = 2880)

# Since I have to load the same data four times I choose the way with selecting
# exact rows (I got number after exploring the dataset). 
# There is another way based on filtering rows according to condition:

# install.packages("sqldf", type = "source")
# library(sqldf)
# system.time(
# data1 <-read.csv.sql("household_power_consumption.txt", 
#                      sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
#                      sep = ";", header = TRUE))

####### Converting date 
Sys.setlocale(locale = "English") # to get weekdays in English
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

######## Plotting

# Plot 3
png(file = "plot3.png", width = 480, height = 480) # open png device 
plot(datetime, data$Sub_metering_1, type = "l", col = "black",
     xlab = "",
     ylab = "Energy sub metering")
points(datetime, data$Sub_metering_2, type = "l", col = "red")
points(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", names(data)[7:9], col = c("black", "red", "blue"), lty = 1)

dev.off()