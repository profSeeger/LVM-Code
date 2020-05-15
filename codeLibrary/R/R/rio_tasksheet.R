install.packages("rio")
install_formats() #optional - adds various 'Suggests' dependencies for rio
library(rio)

# read covid19 from your local
covid19 <- read.csv("us-counties.csv", header = T)
