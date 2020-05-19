# 0 is male, 1 is female
bacteria <- c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1) #bacteria array

newBacteria <- vector()
length <- length(bacteria)
length 
randPosition = sample(1:length, 1) #select a random number
randPosition

v1 <- b1[randPosition]
v1 # value of random

bacteria<-bacteria[- randPosition] # will remove value at position p1
length = length(bacteria)
length 

randPosition <- sample(1:length, 1) #select a random number
randPosition

v2 <- b1[randPosition]
v2 # value of random

bacteria<-bacteria[- randPosition] # will remove value at position p1
length = length(bacteria)
length 

append(newBacteria,v1)
append(newBacteria,v2)
newBacteria

