
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
