# this part of the routine here demonstrates how can we...
# ...load only specific part of the polygon, thus reducing...
# ... memory issues in R Studio

# for e.g. assume you have a datasets which is global polygon
# loading the whole polygon might crash the R, so you want to 
# load the polygon only for the extent of your area of interest

# spatial filter, as wkt:
wkt <- st_as_text(st_geometry(aoi))
# filter by (bbox overlaps of) first feature geometry:
subset <- read_sf("path/to/the/file.gpkg", wkt_filter = wkt)
