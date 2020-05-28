#Initial Shiny Apps
install.packages('rsconnect')
library(rsconnect)

install.packages(c('ggplot2', 'shiny'))
rsconnect::deployApp('shinyDemo')


#rsconnect::setAccountInfo(name='profseeger', token='FCEFBD5D295162F1338C7E82D8CD284C', secret='m/rVhmI0fjRSpkveKUrN+NI3rMHHJD1vw0FzKnFV')
