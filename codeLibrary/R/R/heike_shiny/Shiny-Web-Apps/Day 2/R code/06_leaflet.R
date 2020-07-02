# see https://rstudio.github.io/leaflet/ for great examples
library(tidyverse)
library(leaflet)

isu <-c(-93.64647,  42.02662) 

leaflet() %>% addTiles()

leaflet() %>% addProviderTiles("OpenStreetMap.DE")
leaflet() %>% addProviderTiles(provider="CartoDB.Voyager")
leaflet() %>% addProviderTiles(provider="Esri")


m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-93.65, lat=42.02, zoom=4, popup="The birthplace of R")
addMarkers(lng=-93.67, lat=42.03, zoom=4, label="The birthplace of R")

m

m %>% setView(lng = isu[1], lat = isu[2], zoom=6)

m %>% addProviderTiles(providers$Stamen.Toner)





###########################
# the code below only works if you are registered with the google API
library(ggmap)
isu <- geocode("Iowa State University")
durham <- geocode("Durham Center, Iowa State University", output="more")
write.csv(durham, "data/durham.csv", row.names = FALSE)
###########################

durham <- read.csv("heike_shiny/Shiny-Web-Apps/Day 2/data/durham.csv", stringsAsFactors = FALSE)

m <- leaflet() %>%
  addProviderTiles(provider = "Esri") %>% 
  addMarkers(lng=durham$lon, lat=durham$lat, popup="The birthplace of the Atanasoff-Berry Computer")
m
