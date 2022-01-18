# create function for 11 districts; 28 years; but monthwise (study area: Gandaki province, Nepal)
# The data we used for this script is from the WorldClim.org 
library(terra)

zstats <- function(year, month) {


  # load the climate raster
  rast <-
    terra::rast(paste0("../Desktop/rasters/wc2.1_2.5m_prec_",year,"-",month,".tif"))
  # load the district polygon
  dist <-
    vect("../Desktop/nepal sf/tanahun.gpkg")
  # crop the raster by the polygon
  crop <-
    terra::crop(rast, dist)
  # mask the copped raster by the polygon
  mask <-
    terra::mask(crop, dist)
  # rasterize the polygon
  r <-
    terra::rasterize(dist, mask)
  # compute the zonal statistics
  zstats <-
    terra::zonal(mask,
                 r,
                 fun='sum',
                 na.rm=T)
  # store zonal statistics in data frame
  df.zstats <- data.frame(district="tanahun",
                          year=y,
                          month=m,
                          precipitation=zstats[[2]])
  # return datasets
  return(df.zstats)
}

# # test the function
# final <- zstats(1990, "01")

# call the function in loop to process all the rasters
for (i in 1990:2018) {

  final <-
    zstats(i, "01")

  for (j in c("02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12")) {

    final <-
      rbind(final,
            zstats(i, j))

  }
  write.csv(final,
            paste0("../Desktop/results/tanahun_",i,".csv"),
            row.names = F)
  print(paste("Done processing line", i, sep=" "))
}

# https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_30s_prec.zip
