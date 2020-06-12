#Required packages are jsonlite and httr, you can turn these on in packages tab.
require("jsonlite")
require("httr")
#API URL
path <- "https://api.census.gov/data/2019/pep/population?get=NAME,POP&for=county:*&in=state:19&key=8cd8d699490c6b65fa228d59c5658c4518a7272a"
#Get Call
r <- GET(url = path)
r <- content(r, as = "text", encoding = "UTF-8")
#changing into Dataframe for manipulation. 
df <- fromJSON(r,flatten = TRUE)
df
