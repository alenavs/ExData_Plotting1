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

######## Plotting

# Plot 1
png(file = "plot1.png", width = 480, height = 480) # open png device 

hist(data$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off() # close png device



