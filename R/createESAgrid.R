# the script creates 20*20 spatial grid around the globe (lat/lon tile) [ESA copernicus land cover]

makeESAgrid <- function(xmin=-180, xmax=180, dx=20, ymin=-60, ymax=80, dy=20,
                        proj=NULL) {
  if (is.null(proj)) proj = st_crs(4326)
  ncells = c((xmax - xmin) / dx,
             (ymax - ymin) / dy)

  bbox = st_bbox(c(xmin = xmin, xmax = xmax, ymax = ymax, ymin = ymin))
  st_as_sf(st_make_grid(bbox, cellsize = 20, n = ncells, crs = "EPSG:4326", what = "polygons"))

}

