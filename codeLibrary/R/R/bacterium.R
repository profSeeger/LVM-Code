# 0 is male, 1 is female
bacteria <- c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1) #bacteria array

newBacteria <- c()

for(i in 1:6) {
length <- length(bacteria)
length 
randPosition = sample(1:length, 1) #select a random number
randPosition

v1 <- bacteria[randPosition]
v1 # value of random

bacteria<-bacteria[- randPosition] # will remove value at position p1
length = length(bacteria)
length 

randPosition <- sample(1:length, 1) #select a random number
randPosition

v2 <- bacteria[randPosition]
v2 # value of random

bacteria<-bacteria[- randPosition] # will remove value at position p1
length = length(bacteria)
length 

append(newBacteria,v1)
append(newBacteria,v2)
newBacteria <- c(v1, v2, i)
}



