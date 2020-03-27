# This is a comment
# Below are several lines of code, if you press the run icon above 
# everything after the cursor will be run
# if you want to run/rerun a single line, place cursor at end of line and
# press control/enter. Note you can highlight several lines and press control/enter



# LOADING IN DATA ###################################################################
# There are many ways to load data and work with data types, however at this point 
# the focus is on creating vectors.

# The following assigns the value 56 to object x
x = 56

# type the command x and you will see it appear in the console as [1] 56 
x

# While the = assignment worked, the proper syntax to use is <-
# Read x <- 57   as  variable x gets the value 57
# note that in the pane to the right in the Environemnt tab it shows x has value 56
# when you run the next two lines, the value will be updated to 57

x <- 57
x

# To find out what type of an opject x is, use typeof()
# This tells us that the object created is a double-precision vector of the 
# specified length. It is identical to numeric.
typeof(x) 


# The data structure used above is a vector and is the simplest type of data 
# structure in R. A vector can contain one or a sequence of data elements that 
# are of the same basic type

# When creating a collection you will use c(the data) - the c means to collect or combine combine 

v <- c(1, 3, 5)   #numeric doubles
a <- c("a", "b", "c", "d")  #string characters

v
a
typeof(v)
typeof(a)

# To get the length of the vector - it should result with 4.
length(a)

# Create a list of values 5 to 75
numbers <- 5:75
numbers




# BASIC STATISTICS ######################################################################

# two different data sets are used in the examples below.
testValues <- c(68, 72, 75, 80, 85, 88, 90, 91, 95, 99)
cribbageHands <- c(8, 4, 2, 12, 8, 24, 8, 4, 16, 3)


#The sum of all the values in the vector
sum <- sum(testValues)


# The mean of an observation variable is a numerical measure of the central location of the data values. 
#It is the sum of its data values divided by data count.
mean <- mean(testValues)


# The median of an observation variable is the value at the middle when the data is sorted 
# in ascending order. It is an ordinal measure of the central location of the data values.
median <- median(testValues)


#The range of an observation variable is the difference of its largest and smallest data values. 
#It is a measure of how far apart the entire data spreads in value.
range <-range(testValues)


# The mode is the value that has highest number of occurrences in a set of data. 
# Unike mean and median, mode can have both numeric and character data.
# R does not have a standard in-built function to calculate mode so the 
# following just return "numeric"
mode <- mode(testValues)
mode2 <- mode(cribbageHands)

# create function to calculate mode
getMode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#now call the getMode function
cribbageMode <- getMode(cribbageHands)

#you can also do mode with character values
grades <- c("A", "C", "B", "C", "B", "B", "D", "F", "C", "B", "A", "B")
gradeMode <- getMode(grades)


#There are several quartiles of an observation variable. The first quartile, or 
# lower quartile, is the value that cuts off the first 25% of the data when it is
# sorted in ascending order. The second quartile, or median, is the value that cuts 
# off the first 50%. The third quartile, or upper quartile, is the value that cuts off 
# the first 75%.
cribageQuartile <- quantile(cribbageHands)
cribageQuartile

# The nth percentile of an observation variable is the value that cuts off the first 
# n percent of the data values when it is sorted in ascending order.
lowestThirdCribbageHand <- quantile(cribbageHands, c(.33)) 

lowest2ThirdCribbageHand <- quantile(cribbageHands, c(.33, .66)) 

lowest90PercentCribbageHand <- quantile(cribbageHands, c(.9)) 


# The interquartile range of an observation variable is the difference of its 
# upper and lower quartiles. It is a measure of how far apart the middle
# portion of data spreads in value.
testIQR <- IQR(testValues) 
cribbageIQR <- IQR(cribbageHands) 


#The variance is a numerical measure of how the data values is dispersed around the mean
testVariance <- var(testValues)
cribbageVariance <- var(cribbageHands)

#standard deviation
testSD <- sd(testValues)
cribbageSD <- sd(cribbageHands)








# BASIC PLOTS ######################################################################

#Intro to basic plot types using base R

testValues <- c(68, 72, 75, 80, 85, 88, 90, 91, 95, 99)

#plot as points
plot(testValues, type="p", main = "points")

#plot as lines
plot(testValues, type="l", main = "lines")

#plot as points and lines
plot(testValues, type="b", main = "points and lines")

#plot as line histogram
plot(testValues, type="h", main = "histogram of lines")

#histogram
hist(testValues) #this has a default title

# stem leaf plots allow for the setting of the scale. Default is 1.
stem(testValues, scale = 1)

stem(testValues, scale = 10)

stem (cribbageHands, scale = 1)

boxplot(testValues, horizontal=FALSE)  # vertical box plot
boxplot(cribbageHands, horizontal=FALSE)  # vertical box plot


