install.packages("tidyverse")
library(tidyverse)

# the rio package will be used to assist with input/output needs. For more info on rio
#   https://github.com/leeper/rio
#   https://www.rdocumentation.org/packages/rio/versions/0.5.16
#   https://www.youtube.com/watch?v=JYVWufSQ4OI
install.packages("rio")
library(rio)

# Import Data Using Rio #####################################################################################

# import a csv file
csvDF <- import("BRSV_GMT.csv")
csvDF

# import a xlsx file
xlsxDF <- import("herds.xlsx")
xlsxDF

# When importing an Excel worksheets, if you don't specifythe worksheet it selects the first one.
xlsDF_months <- import("demoExcelWorksheets.xls")
xlsDF_months

# To specify which Excel worksheet to import.
xlsDF_favColors <- import("demoExcelWorksheets.xls",  sheet = "favColors")
xlsDF_favColors

# This will import a list of all the worksheets and their data into the dataframe worksheetDF
worksheetDF <- import_list("demoExcelWorksheets.xls")
worksheetDF
# If this process is used you can still access the exact sheet you want using worksheetDF$ and name of sheet
head(worksheetDF$months)

# Import directly from a web file where the text is already formatted as delimited text
# In these two examples Satante and County COVID data from the New York Times Github repository are loaded
# A benefit to this methos is that if the data is frequently updated, you just need to rerun the R script and
# you will be working with the newest data
covidCountyURL_DF <- import("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
covidCountyURL_DF
# State COVID data
covidStateURL_DF <- import("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")
covidStateURL_DF

# Import an html tabel - this all depends on the format of the HTML web page. Complex pages do not seem to work well
abbrevDF <- import("http://app02.clerk.org/menu/ccis/Help/CCIS%20Codes/state_codes.html")
abbrevDF


# If you need to access a complex HTML table or HTML list, first create a Google Sheet and use the IMPORTHTML()
# function to pull in the data. Then publish the Google Sheet as a csv file online and use the URL in the import.
# For more info on IMPORTHTML see https://support.google.com/docs/answer/3093339?hl=en
# Note Google Sheets also has IMPORTDATA() which will import .csv (comma-separated value) or 
# .tsv (tab-separated value) formatted data from a specified URL. But rio already does that!
# This example refers to a Google Sheet that is loading cash grain bids for zip 585785
# You can see the page here https://www.agweb.com/markets/cash-grain-bids?zip=58575
# The first table on the page is for Italgrani USA - Benedict, ND - Google Sheets imports jsut this first table
# but if I wanted Blue Flint Ethonal LLC - Underwood, ND I would tell it to import table 2.

googleSheetsURL <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vSpE_43AzlyPaJ25Gvxp1Tg2oS41n3qfsdUt9MuG3YExMcO43MXLYhN5gdoMtlTiSnhW1HddYCj3MrT/pub?output=csv"
agwebDF <- import(googleSheetsURL, format = "csv")

myCSV<-read.csv(googleSheetsURL)


# Export data #############################################################################

# specify `file` and `format` to override default format of the file export
export(xlsDF_favColors, file = "xlsDF_favColors.txt", format = "csv")

# export to JSON
export(xlsDF_favColors, "xlsDF_favColors.json")

