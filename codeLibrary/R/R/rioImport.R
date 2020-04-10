install.packages("tidyverse")
library(tidyverse)

# for more info on rio
#   https://github.com/leeper/rio
#   https://www.rdocumentation.org/packages/rio/versions/0.5.16
#   https://www.youtube.com/watch?v=JYVWufSQ4OI
install.packages("rio")
library(rio)

# Import Data Using Rio #####################################################################################

# import csv file
csvDF <- import("BRSV_GMT.csv")
csvDF

# import xlsx file
xlsxDF <- import("herds.xlsx")
xlsxDF

# with Excel worksheets, if you don't specify, it selects the first one.
xlsDF_months <- import("demoExcelWorksheets.xls")
xlsDF_months

# worksheets, specify worksheet to import.
xlsDF_favColors <- import("demoExcelWorksheets.xls",  sheet = "favColors")
xlsDF_favColors

# this will import a list of all the worksheets and their data into var worksheets
worksheetDF <- import_list("demoExcelWorksheets.xls")
worksheetDF
# if this process is used you can then still access the sheet you want using work
head(worksheetDF$months)

# import directly from a web file where the text is already formatted as delimited text
# in this example, County COVID data from the NYT repository is loaded
covidCountyURL_DF <- import("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
covidCountyURL_DF
# State COVID data
covidStateURL_DF <- import("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")
covidStateURL_DF

# import an html tabel - this all depends on format of HTML web page, but it is a feature of rio
abbrevDF <- import("http://app02.clerk.org/menu/ccis/Help/CCIS%20Codes/state_codes.html")
abbrevDF


# Export data #############################################################################

# specify `file` and `format` to override default format of the file export
export(xlsDF_favColors, file = "mtcars.txt", format = "csv")

# export to JSON
export(mtcars, "mtcars.json")


# Filter COVID data, make plot and export data ############################################################

# filtering requires the dplyr or tidyverse package


head(covidStateURL_DF)

#select teh state of interest
theState <- "North Dakota"

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


ggplot(filtered_NDcovid_DF, aes(x=date, y=cases)) +
  geom_line() +
  labs(x = "Date",
       y = "Cases",
       title = "COVID cases in North Dakota",
       subtitle = subtitle)


# optionally plot as points
ggplot(data = filtered_NDcovid_DF, aes(x = date, y = cases)) +
  geom_point() +
  labs(x = "Deaths",
       y = "Cases",
       title = "COVID cases in North Dakota",
       subtitle = subtitle)


# optionally include cases and deaths - dashes added as a style
## reference https://www.datanovia.com/en/blog/how-to-create-a-ggplot-with-multiple-lines/
ggplot(data = filtered_NDcovid_DF, aes(x = date)) +
  geom_line(aes(y = cases), color="steelblue", linetype="twodash")  +
  geom_line(aes(y = deaths), color = "red") +
  scale_colour_manual("", 
                      breaks = c("Cases", "Deaths"),
                      values = c("blue", "red")) +
  labs(x = "Deaths",
       y = "Cases",
       title = "COVID cases in North Dakota",
       subtitle = subtitle)