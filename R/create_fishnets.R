# the script here uses example from the wdpa database of KfW and source script `area_proj`

# load required libraries
library(sf)
library(dplyr)

# load wdpa polygons
wdpa_kfw<-
  read_sf("data/wdpa_kfw_spatial_latinamerica_2021-04-22_allPAs.gpkg")
# filter the polygons 
pa <- wdpa_kfw %>%
  filter(ISO3 %in% "BOL")
# source routine `area_proj`
source("code/area_proj.R")
# transform to laea projection
pa<-
  st_transform(pa,crs = area_proj(pa))
# get bbox
bbox = st_as_sf(st_as_sfc(st_bbox(pa)))

# pass the area of cell in square kilometers
cellarea <- 5 * (1e+6) # for 5 sqkm
cellsize <- 2 * sqrt(cellarea / ((3 * sqrt(3) / 2))) * sqrt(3) / 2
hexa <- st_make_grid(x = bbox,
                     cellsize = cellsize,
                     square = FALSE)
hexa <- st_transform(hexa, 4326)
write_sf(hexa, "../Fishnets/fishnet_500_sqm.gpkg")

# Note: You can find the source code `area_proj` in the GitHub mapme.protectedareas
