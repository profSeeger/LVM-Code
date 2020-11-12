# Let's read the jeoJson file that is stored on the web with the geojsonio library:
install.packages("geojsonio")

library(geojsonio)
#spdf <- geojson_read("https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/communes.geojson",  what = "sp")

install.packages(c("maps", "mapdata"))


library('maps')
data(us.cities)
geojson_json(us.cities[1:2, ], lat = 'lat', lon = 'long')




install.packages("rio")
library(rio)


myURL <- "https://indicators.extension.iastate.edu/projects/DSPG/database/tinyTests"

chris <- import(myURL, format = "json")


#Path to current file
rstudioapi::getSourceEditorContext()$path

#path to current directory
myPath <- dirname(rstudioapi::getSourceEditorContext()$path)


destfile <- paste0(myPath, "/tinyTests2.geojson")

# Apply download.file function in R
download.file(myURL, destfile)

download.file(myURL, destfile, method = "auto")






spdf <- geojson_read("https://indicatorstest.extension.iastate.edu/projects/DSPG/database/tinyTests/",  what = "sp")



# Select only the region #6
spdf@data$mystate = substr( spdf@data$code, 1, 2)
spdf_region_6 = spdf[ spdf@data$mystate == "06" , ]
spdf_region_7 = spdf[ spdf@data$mystate == "07" , ]


# plot the selected area with sp
library(sp)
par(mar=c(0,0,0,0))
plot(spdf_region_6, col="grey")
plot(spdf_region_7, col="red")