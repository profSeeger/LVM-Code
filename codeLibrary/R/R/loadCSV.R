
# This will print out the working path, not the syntax of / or \ for mac vs PC
getwd()  

myWorkingPath <- getwd()  #gets the local working path
myFile <- '/covid.csv'    #the name of the file - note on the mac I prefixed it with /  on a PC you use \

myPath <- paste(myWorkingPath,myFile,sep="")
myPath

df <- read.csv(myPath, header = TRUE, sep = ",")


# optionally, if we are already in our working directory 
df <- read.csv('covid.csv', header = TRUE, sep = ",")

df #this only prints a subset of the data frame as ther is a max that can be printed.

#to see jsut he header and first six row of the data
head(df)

sum(df$cases)
sum(df$deaths)

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)
options(stringsAsFactors = FALSE)

myStateDF <- select(filter(df, state == "North Dakota"), c(date, state, cases, deaths))

head(myStateDF)



# convert date column to date class
myStateDF$date <- as.Date(myStateDF$date, format = "%m/%d/%y")

# plot the data using ggplot
ggplot(data = myStateDF, aes(x = date, y = cases)) +
  geom_point() +
  labs(x = "Date",
       y = "Total Cases",
       title = "Covid 19 Cases",
       subtitle = "ND")


