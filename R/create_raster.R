# the script below shows us how to create raster from scratch and update resolution and add values to the rasters 
# NOTE: EPSG = 4326 (WGS 84)

library(terra)
# lets initiate a raster x with some bounding box
# Note: You can get bounding box using st_bbox from sf object
x <- rast(xmin=-70.3064159671597, xmax=-59.5707349268493, ymin=-23.3163534733174, ymax=-10.6381923913516)
# view the properties
x
# we can change the resolution of the rasters using res function
res(x) <- 0.0001 # 0.0001 equals ~11.1 meter spatial resolution
# check whether the raster we created has values or not
hasValues(x)
# add some random values to the rasters
set.seed(0)
values(x) <- runif(ncell(x))
# check again whether the raster we created has values or not
hasValues(x)
# lets view properties again
x
# plot to see the raster
plot(x)
