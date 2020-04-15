install.packages("tidyverse")
library(tidyverse)

# the rio package will be used to assist with input/output needs. For more info on rio
#   https://github.com/leeper/rio
#   https://www.rdocumentation.org/packages/rio/versions/0.5.16
#   https://www.youtube.com/watch?v=JYVWufSQ4OI
install.packages("rio")
library(rio)


# Load COVID data
covidCountyURL_DF <- import("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
covidCountyURL_DF
# State COVID data
covidStateURL_DF <- import("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")
covidStateURL_DF



filtered_county <- select(filter(covidCountyURL_DF, state == "Iowa"), c(date, state, county, cases, deaths))

export(filtered_county, file = "covid_county.txt", format = "csv")





# Filter COVID data, make plot and export data ############################################################

# filtering requires the dplyr or tidyverse package

head(covidStateURL_DF)

#select the state of interest -it woud be nice if changing this could be interactive.
theState <- "Iowa"


mainTitle <- paste("COVID cases in ", theState)


#make a dataframe of just North Dakota COVID data by filtering covidStateURL_DF
filtered_NDcovid_DF <- select(filter(covidStateURL_DF, state == theState), c(date, state, cases, deaths))
head(filtered_NDcovid_DF) #check the results

# take a look at the field types of filtered_NDcovid_DF and notice the date is a character string, 
str(filtered_NDcovid_DF)
# convert date column to date class - see tutorial at 
# https://www.earthdatascience.org/courses/earth-analytics/time-series-data/date-class-in-r/
filtered_NDcovid_DF$date <- as.Date(filtered_NDcovid_DF$date, format = "%Y-%m-%d")
str(filtered_NDcovid_DF) #just confirming the date is now a date


days <- NROW(filtered_NDcovid_DF)
# asOfDate <- filtered_NDcovid_DF$date[days] #line below is better as it formats the date
asOfDate <- format(as.Date(filtered_NDcovid_DF$date[days]), "%m/%d/%Y")
totalCases <- filtered_NDcovid_DF$cases[days]
totalDeaths <- filtered_NDcovid_DF$deaths[days]

# paste("Today is", date())

subtitle <- paste("As of ", asOfDate, " Total cases:", totalCases, " Total deaths:", totalDeaths)



#plot1
ggplot(filtered_NDcovid_DF, aes(x=date, y=cases)) +
  geom_line() +
  labs(x = "Date",
       y = "Cases",
       title = mainTitle,
       subtitle = subtitle)




# plot 2 - optionally plot as points
ggplot(data = filtered_NDcovid_DF, aes(x = date, y = cases)) +
  geom_point() +
  labs(x = "Deaths",
       y = "Cases",
       title = mainTitle,
       subtitle = subtitle)




# plot 3 - optionally include cases and deaths - dashes added as a style
## reference https://www.datanovia.com/en/blog/how-to-create-a-ggplot-with-multiple-lines/
ggplot(data = filtered_NDcovid_DF, aes(x = date)) +
  geom_line(aes(y = cases), color="steelblue", linetype="twodash")  +
  geom_line(aes(y = deaths), color = "red") +
  scale_colour_manual("", 
    breaks = c("Cases", "Deaths"),
    values = c("blue", "red")) +
  labs(x = "Deaths",
       y = "Cases",
       title = mainTitle,
       subtitle = subtitle)