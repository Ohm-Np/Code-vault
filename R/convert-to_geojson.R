library(sf)
library(rgdal)

# load gpkg
sf <- readOGR("../test/geojtest.gpkg")

# write geojson to file
writeOGR(sf,
         "../test/geo1.geojson",
         layer = "geo1",
         driver="GeoJSON")
  
