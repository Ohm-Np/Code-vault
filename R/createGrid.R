# the script creates 10*10 spatial grid around the globe (lat/lon tile)  

makeGFWGrid <- function(xmin=-180, xmax=170, dx=10, ymin=-50, ymax=80, dy=10,
                        proj=NULL) {
  if (is.null(proj)) proj = st_crs(4326)
  ncells = c((xmax - xmin) / dx,
             (ymax - ymin) / dy)

  bbox = st_bbox(c(xmin = xmin, xmax = xmax, ymax = ymax, ymin = ymin))
  st_as_sf(st_make_grid(bbox, cellsize = 10, n = ncells, crs = "EPSG:4326", what = "polygons"))

}
