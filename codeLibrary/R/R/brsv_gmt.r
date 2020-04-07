install.packages("tidyverse")
library(tidyverse)

# Load CSV data #########################################################################################

# Load herds.cvs from working directory
df_brsv <- read.csv("BRSV_GMT.csv", header = TRUE, sep = ",")
head(df_brsv) # by default this prints the first 6 records. Optionally to print 3 rows head(df_herds, 3)

# Display a summary of the df_brsv dataset
summary(df_brsv)


# Simple row column summary #####
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/colSums
colSums (df_brsv, na.rm = TRUE, dims = 1)
rowSums (df_brsv, na.rm = FALSE, dims = 1)
colMeans(df_brsv, na.rm = TRUE, dims = 1)
rowMeans(df_brsv, na.rm = FALSE, dims = 1)



# You can use function colSums() to calculate sum of all values.  [,-1] ensures that first column with 
# header names is excluded.
colSums <- colSums(df_brsv[,-1])
# Problem notice that the last two columns result in a NA


# Using Pipes and PURR #################################
#Instead you can use dplyr and purr library - both part of tidyverse. Notice the syntax uses pipes %>%
df_brsv %>% summarize_if(is.numeric, sum, na.rm=TRUE)
# Notice that the output is now correct

# the na.rm is TRUE tells the function to skip over any NA values. However, when na.rm is FALSE, 
# then it returns NA from the calculation being done on the entire row or column.

df_brsv %>% summarize_if(is.numeric, mean, na.rm=TRUE)

df_brsv %>% summarize_if(is.numeric, median, na.rm=TRUE)

df_brsv %>% summarize_if(is.numeric, sd, na.rm=TRUE)


# Access just one column ###################











