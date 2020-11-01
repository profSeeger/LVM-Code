# Let's read the jeoJson file that is stored on the web with the geojsonio library:


library(geojsonio)
spdf <- geojson_read("https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/communes.geojson",  what = "sp")