# Let's read the jeoJson file that is stored on the web with the geojsonio library:
install.packages("geojsonio")

library(geojsonio)
spdf <- geojson_read("https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/communes.geojson",  what = "sp")


# Select only the region #6
spdf@data$mystate = substr( spdf@data$code, 1, 2)
spdf_region_6 = spdf[ spdf@data$mystate == "06" , ]
spdf_region_7 = spdf[ spdf@data$mystate == "07" , ]


# plot the selected are with sp
library(sp)
par(mar=c(0,0,0,0))
plot(spdf_region_6, col="grey")

plot(spdf_region_7, col="red")