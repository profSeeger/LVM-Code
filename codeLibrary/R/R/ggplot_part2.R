# Introduction #######################################################################################

# The tidyverse is an opinionated collection of R packages designed for data science. 
# All packages share an underlying design philosophy, grammar, and data structures. 
# You can optionally nstall the complete tidyverse with: install.packages("tidyverse")
# or you can install individual componets such as dplyr or ggplot2 individually.
# For more info see https://www.tidyverse.org

# The dplyr package provides a set of tools for efficiently manipulating datasets in R.
# dplyr is an upgrade to plyr, focussing on only data frames. With dplyr, anything you can do 
# to a local data frame you can also do to a remote database table
# install.packages("dplyr")
# library(dplyr)

# ggplot2 is a system for declaratively creating graphics, based on The Grammar of Graphics. 
# You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives 
# to use, and it takes care of the details. For more details see https://ggplot2.tidyverse.org
# install.packages("ggplot2")
# library(ggplot2)
# options(stringsAsFactors = FALSE)

# Load Packages #########################################################################################
# Because we will be often using both dplyr and ggplot2, we will just load the tidyverse from the start

install.packages("tidyverse")
library(tidyverse)

# Load CSV data #########################################################################################

# Load herds.cvs from working directory
df_herds <- read.csv('herds.csv', header = TRUE, sep = ",")
head(df_herds) # by default this prints the first 6 records. Optionally to print 3 rows head(df_herds, 3)

# Display a summary of the df_herds dataset
summary(df_herds)

# ggplot scatterplot ########################################################################################

# create a dot plot of all herds
# plot the data using ggplot
ggplot(data = df_herds, aes(x = rancher, y = herdSize)) +
  geom_point() +
  labs(x = "Rancher",
       y = "Herd Size",
       title = "Vaccine Study Ranches and Herd Size",
       subtitle = "Dr. Seeger, April 2020")


# ggplot alternative format style #######################################################################
p <- ggplot(df_herds, aes(x=rancher, y= herdSize))
p + geom_point(size = 4) #change size of the dot
p + geom_point(aes(colour = factor(herdSize)), size = 4)  #See example below to make your own color breaks
p + geom_point(aes(colour = factor(state)), size = 4)  #Uses the state - so Wyoming is pink for both

#optionally use shapes instead of colored dots
p + geom_point(aes(shape = factor(state)), size = 4)  #there appears to be only six shapes

l <-labs(x = "Rancher", y = "Herd Size",title = "Vaccine Study Ranches and Herd Size", subtitle = "Dr. Seeger, April 2020")
p + geom_point(size = 4) + l


# ggplot scatterplot colored at herd size intervals ######################################################
ggplot(data = df_herds, aes(x = rancher, y = herdSize)) +
  geom_point(aes(colour = cut(herdSize, c(-Inf, 200, 400, Inf))), size = 5) +
  scale_color_manual(name = "Herd Size",
    values = c("(-Inf,200]" = "black",
        "(200,400]" = "yellow",
        "(400, Inf]" = "red"),
        labels = c("<= 200", "200 to 400", "> 400")) +
    labs(x = "State",
       y = "Herd Size",
       title = "Vaccine Study Ranches and Herd Size",
       subtitle = "Dr. Seeger, April 2020")




# ggplot scatterplot grouped by state #####################################################################
# not working !!!!!
#next make a new plot that shows the total animals in each state
ggplot(data = df_herds, aes(x = state, y = herdSize)) +
  stat_summary(fun.y = sum, # adds up all observations for the state
geom = "bar") + # or "line"
  
  
  
  
  geom_point(aes(colour = cut(qsec, c(-Inf, 100, 200, Inf))),size = 5) +
  scale_color_manual(name = "herdSize",
                     values = c("(-Inf,100]" = "black",
                                "(100,200]" = "yellow",
                                "(200, Inf]" = "red"),
                     labels = c("<= 17", "17 < qsec <= 19", "> 19")) +
  labs(x = "State",
       y = "Herd Size",
       title = "Vaccine Study Ranches and Herd Size",
       subtitle = "Dr. Seeger, April 2020")





# ggplot bar chart #########################################################################################

# A count of the states expressed in a bar chart
a <- ggplot(df_herds, aes(factor(state)))
a + geom_bar()
a + geom_bar(aes(fill = factor(state)))

