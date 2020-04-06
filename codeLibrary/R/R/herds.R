install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)
options(stringsAsFactors = FALSE)



# Load herds.cvs from working directory
df <- read.csv('herds.csv', header = TRUE, sep = ",")
head(df)

sum(df$herdSize) #3551
min(df$herdSize) #150
max(df$herdSize) #653
mean(df$herdSize) #322.8182
median(df$herdSize) #234

mean(df$herdSize,trim = 0.1) #305.3333
mean(df$herdSize,trim = 0.2) #278.2857


range(df$herdSize) #150 653

quantile( x = df$herdSize, probs = .5) #234
quantile( x = df$herdSize, probs = c(.33, .66)) #212 324 

sd( df$herdSize) # 186.5153
summary(df)


#getMode requires a function!
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(df$state)




# create a dot plot of all herds
# plot the data using ggplot
ggplot(data = df, aes(x = rancher, y = herdSize)) +
  geom_point() +
  labs(x = "Rancher",
       y = "Herd Size",
       title = "Vaccine Study Ranches and Herd Size",
       subtitle = "Dr. Seeger, April 2020")




#show just South Dakota herds
filteredDF <- select(filter(df, state == "SD"), c(herdSize, rancher))
head(filteredDF) #check the results


# plot the data using ggplot but also adding in the herd size next to the point and changing the color of the point
ggplot(data = filteredDF, aes(x = rancher, y = herdSize)) +
  geom_point(color='blue') +
  geom_text(aes(label=herdSize),hjust=-.5, vjust=0) +
  labs(x = "Rancher",
       y = "Herd Size",
       title = "Vaccine Study Ranches and Herd Size",
       subtitle = "Dr. Seeger, April 2020")
