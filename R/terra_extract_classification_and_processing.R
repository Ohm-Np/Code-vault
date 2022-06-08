## Processing hurricane data for spatial impact evaluation
# Author: Johannes Schielein
# Last Edit: 2022-06-03

# call libraries
library(terra)
library(pbmcapply)
library(tidyverse)

# load input data
# AOIs - these AOIs contain polyid and CRS
aoi <-
  vect("../../Om/test/honeycomb_5_sqkm_subset_crs_polyid.gpkg")
# hurricane data
# note: the preprocessed data is not available online. It was created with an own cript
# Ths script is part of the repository available under "code/development/hurricanes.R"
hurricanes <-
  rast("../../datalake/mapme.protectedareas/processing/hurricanes/2000-2020_V03/max_likely_windspeed_H01_global_2000-2020.tif")

# create routine to classify hurricane raster
lapply(2000:2020, function(i) {
  
  print(paste("Start processing year", i))

  # create index for year passed
  year_index <- data.frame(
    year = 2000:2020,
    index = 1:21
  )
  # extract index from year
  n <- subset(year_index,
    year == i,
    select = index
  )
  # retrieve hurricane raster for the year
  h <- hurricanes[[n[[1]]]]
  # get min and max values from raster
  v <- terra::minmax(h)
  # create matrix
  m <- c(
    NA, 0, 0,
    v[[1]] - 1, v[[2]] + 1, 1
  )
  # create a classification matrix
  rclmat <- matrix(m,
    ncol = 3,
    byrow = TRUE
  )
  # classify the raster using the matrix
  rc1 <- classify(
    h,
    rclmat
  )

  # create processing routine to get the area affected and not affected by hurricanes
  area_stats <- pbmclapply(290000:313000, function(j) {
    tryCatch(
      {

        # crop the classified raster to the polygon
        crop <- terra::crop(
          rc1,
          aoi[j, ]
        )
        # mask the classified raster to the polygon
        mask <- terra::mask(
          crop,
          aoi[j, ]
        )
        # compute area raster
        area_raster <- cellSize(mask,
          unit = "km"
        )
        # create patchsizes using terra extract
        extract_area <- terra::extract(
          area_raster,
          aoi[j, ],
          sum
        )
        # terra extract from mask layer
        mask_terra <- terra::extract(
          mask,
          aoi[j, ]
        )
        # aggregate values
        mask_terra <-
          aggregate(. ~ max,
            data = mask_terra,
            FUN = sum
          )
        # rename the class
        class_name <- data.frame(
          max = c(0, 1),
          classes = c("not_affected", "affected")
        )

        if (nrow(mask_terra) == 2) {
          # area computation per cell
          area_of_polygon <- extract_area[[2]]
          ncells <- mask_terra[[2]][1] + mask_terra[[2]][2]
          area_per_cell <- area_of_polygon / ncells
          # area per class values
          area_values_0 <-
            area_per_cell * mask_terra[[2]][1]
          area_values_1 <-
            area_per_cell * mask_terra[[2]][2]
          # mask terra add column area
          mask_terra$area <- c(area_values_0, area_values_1)
          # merge patchsizes and class name data frame
          out <- merge(
            x = mask_terra, y = class_name,
            by.x = colnames(mask_terra)[1],
            by.y = colnames(class_name)[1]
          )
          out <- out[, -c(1, 2)]
          # add polygon id to the result
          out$poly_id <- aoi[j, ]$poly_id
          # pivot to long format
          result <- tidyr::pivot_longer(out,
            cols = "area"
          )
        } else {
          # area computation per cell
          area_of_polygon <- extract_area[[2]]
          ncells <- mask_terra[[2]]
          area_per_cell <- area_of_polygon / ncells
          if (mask_terra[[1]] == 0) {
            area_values_0 <-
              area_per_cell * mask_terra[[2]]
            # mask terra add column area
            mask_terra$area <- area_values_0
          } else {
            area_values_1 <-
              area_per_cell * mask_terra[[2]]
            # mask terra add column area
            mask_terra$area <- area_values_1
          }
          # merge patchsizes and class name data frame
          out <- merge(
            x = mask_terra, y = class_name,
            by.x = colnames(mask_terra)[1],
            by.y = colnames(class_name)[1]
          )
          out <- out[, -c(1, 2)]
          # add polygon id to the result
          out$poly_id <- aoi[j, ]$poly_id
          # pivot to long format
          result <- tidyr::pivot_longer(out,
            cols = "area"
          )
        }
        result
      },
      error = function(e) {
        message("Error in this line!")
      }
    )
  }, mc.cores = 2)
  # unlist the list as data frame
  final <- dplyr::bind_rows(area_stats)
  # write result to disk
  write.csv(
    final,
    paste0("../../Om/test/honeycomb_5sqkm_hurricanes_", i, ".csv"),
    row.names = FALSE
  )
  # remove temp files
  tmpFiles(remove = T)
  # message
  print(paste0("Done processing for year", i, sep = " "))
})

## NOTE:
# The scripts above process for all years 2000 to 2020 and saves the result yearly as csv file
