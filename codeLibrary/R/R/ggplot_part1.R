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
# Because we will be often using both dplyr and ggplot2 often, either uncomment and run the line below
# or go tot he packages list to the lower right and check tidyverse
# install.packages("tidyverse")


# Load CSV data #########################################################################################

# Load herds.cvs from working directory
df_herds <- read.csv('herds.csv', header = TRUE, sep = ",")
head(df_herds)

# Display a summary of the df_herds dataset
summary(df_herds)


# create a dot plot of all herds
# plot the data using ggplot
ggplot(data = df, aes(x = rancher, y = herdSize)) +
  geom_point() +
  labs(x = "Rancher",
       y = "Herd Size",
       title = "Vaccine Study Ranches and Herd Size",
       subtitle = "Dr. Seeger, April 2020")