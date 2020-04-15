install.packages("tidyverse")
library(tidyverse)

install.packages("rio")
library(rio)

# Import Data Using Rio #####################################################################################
Tx1DF <- import("NDSU13.xlsx",  sheet = "Tx1")
Tx1DF

# A really basic boxplot.
ggplot(Tx1DF, aes(x=CalfSex, y=GMT_31)) + 
  geom_boxplot(
    fill="orange", 
    alpha=0.6,   #this is the transparency of the orange fill
    color="slateblue",   #this is the box outline color
    
    # Add a notch the boxplot.
    notch=TRUE,
    notchwidth = 1.0,  #change to 0.8 to see impact
    
    # custom outliers
    outlier.colour="red",
    outlier.fill="red",
    outlier.size=3
    ) + 
  xlab("Sex")+
  ylab("GMT")+
  labs( title = "Study Title", subtitle = "-31 Days") +

    geom_jitter(   #see https://ggplot2.tidyverse.org/reference/position_jitter.html
      height = 0.1,
      width = 0.4,
    fill="black", 
    alpha=0.6, 
  )

