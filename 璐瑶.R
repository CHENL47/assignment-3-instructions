setwd("~/Downloads")
flights <- read.csv('flights.csv')
sub_flights <- subset(flights, dep_time<553 &year==2013 & month == 2 & day == 28) #choose the subset from the flights data which meets the criteria described in the question
sub_flights #compute the extracted subtable
nrow(sub_flights) #we have 10 rows of this subtable
ncol(sub_flights) #and 20 columns

airports <- read.csv('airports.csv')
merged_sub_flights <- merge(sub_flights,airports,by.x=c("dest"),by.y=c("faa"))
B2 <- subset(merged_sub_flights,select=c(dep_time, carrier, flight, name)) 
B2

planes <- read.csv('planes.csv')
merged_tailnum <- merge(flights, planes, by = c('tailnum'))
selected_merged_tailnum <- subset(merged_tailnum, select = c(year.y, carrier, tailnum))
#unique_tailnum <- unique(selected_merged_tailnum)
B3 <- aggregate(year.y~carrier, unique_tailnum, mean)
B3$year.y <- 2013 - B3$year.y
B3

