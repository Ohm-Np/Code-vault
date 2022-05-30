# rescale the raster resolution to higher pixel values
# with increase in fact, the resolution gets increasing
r <- terra::disagg(raster,
                    fact = 74)
                    
# to downscale the resolution
terra::aggregate(raster,
                 fact = 2,
                 fun = "sum")
