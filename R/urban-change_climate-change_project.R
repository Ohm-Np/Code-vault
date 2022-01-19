# install.packages("remotes")
library(remotes)

# --- get GADM data ---
remotes::install_github("ohm-Np/openRspat")
library(openRspat)
get_gadm_gpkg("NPL","../Downloads")
unzip(zipfile = "../Downloads/NPL.zip",
      exdir = "../Downloads")


# --- subset Kathmandu valley from the GADM polygon ---
install.packages("sf")
library(sf)
library(dplyr)
npl <- read_sf("../Downloads/gadm36_NPL.gpkg")
plot(npl[1])
# install.packages("mapview")
library(mapview)
mapview(npl)
install.packages("dplyr")
library(dplyr)
npl.ktm <- npl %>%
  filter(NAME_3 == "Kathmandu")
npl.ltp <- npl %>%
  filter(NAME_3 == "Lalitpur")
npl.bkt <- npl %>%
  filter(NAME_3 == "Bhaktapur")
plot(npl.ktm[1])
study_area <- bind_rows(npl.ktm, npl.bkt, npl.ltp)
plot(study_area[1])
write_sf(study_area,
         "../Downloads/study_area.gpkg")

# --- not working ---
install.packages("devtools")
library(devtools)
devtools::install_github("16EAGLE/getSpatialData")
library(getSpatialData)
library(raster)
install.packages("tidyverse")
library(tidyverse)
library(sf)
regions <- st_read("../Downloads/study_area.gpkg")
str(regions)
p <- ggplot(regions) +
  geom_sf(aes(fill = NA), colour="white")
p + geom_sf_label(aes(label = NA, colour = "black", size = 2.0)
plot(p)
plot("p")
install.packages("rgdal")
library("rgdal")
attitude
npl <-
  regions %>%
  summarise(area = sum(Label))
p <- ggplot(npl) + geom_sf(aes(fill = area), colour="black") 
p + geom_sf_text(aes(label = "kathmandu[1]"), colour = "white", size = 5.0)
set_aoi(st_geometry(npl))
set_aoi(st_geometry(sutdy.area[1]))
view_aoi()
login_USGS(username ="Abhishek_Kunwar")
set_archive("./Downloads/")
records <- getSentinel_query(time_range = c("2020-01-01", "2020-12-30"), 
                              platform = "sentinel-1")
get_products()
install.packages("kniDownloadstr")
ibrary(knitr)
knitr::include_graphics(".//levels.png")
                  
# --- load landsat rasters to the R environment                
# install.packages("terra")
library (terra)
landcover_2005_SWIR <- rast("../Downloads/LE07_L1TP_141041_20050104_20170116_01_T1/LE07_L1TP_141041_20050104_20170116_01_T1_B5.tif")
landcover_2005_NIR<-rast("../Downloads/LE07_L1TP_141041_20050104_20170116_01_T1/LE07_L1TP_141041_20050104_20170116_01_T1_B4.tif")
ndbi_2005 <-  (landcover_2005-SWIR - landcover_2005-NIR) / (landcover_2005-SWIR + landcover_2005-NIR)

# --- load study area polygon ---
study_area <- vect("../Downloads/study_area.gpkg")
study_area
landcover_2005_SWIR
study_area.v <- terra::project(study_area,crs(landcover_2005_SWIR))
study_area.v
                  
# --- crop and mask landsat rasters by study area polygon ---
lc_2005_swir.crop <- crop(landcover_2005_SWIR, study_area.v )
lc_2005_nir.crop <- crop(landcover_2005_NIR, study_area.v )
lc_2005_swir.mask <- mask(lc_2005_swir.crop, study_area.v )
lc_2005_nir.mask <- mask(lc_2005_nir.crop, study_area.v )
rm(vector_filepath)
s <- lc_2005_swir.mask
n <- lc_2005_nir.mask

# --- compute NDBI ---
ndbi <- (s - n)/(s + n)
plot(ndbi)
0....NDBI_2005<-(lc_2005_swir.mask ??? lc_2005_nir.mask)/(lc_2005_swir.mask + lc_2005_nir.mask)
R <- rast("../Downloads/LE07_L1TP_141041_20050104_20170116_01_T1/LE07_L1TP_141041_20050104_20170116_01_T1_B3.tif")

R.crop <- crop(R, study_area.v )
R.mask <- mask(R.crop, study_area.v )
r<-r.mask
s2005<- rast("../Downloads/LE07_L1TP_141041_20050104_20170116_01_T1/LE07_L1TP_141041_20050104_20170116_01_T1_B7.tif")
n2005 <- rast("../Downloads/LE07_L1TP_141041_20050104_20170116_01_T1/LE07_L1TP_141041_20050104_20170116_01_T1_B4.tif")
s2005.c <- crop(s2005, study_area.v)
s2005.m <- mask(s2005.c, study_area.v)
n2005.c <- crop(n2005, study_area.v)
n2005.m <- mask(n2005.c, study_area.v)
                  
# --- compute Urban Index ---
ui2005 <- (s2005.m-n2005.m)/(s2005.m+n2005.m)
plot(ui2005)
writeRaster(ui2005, "../Downloads/ui_2005.tif")
library(terra)
writeVector(study_area.v, "../Downloads/study_area-v.gpkg")
kv<-vect("../Downloads/study_area-v.gpkg")
plot(kv)
library(terra)
j18<-rast("../Downloads/wc2.1_2.5m_tmax_2010-2018/wc2.1_2.5m_tmax_2018-06.tif")
kv<-vect("../Downloads/study_area-v.gpkg")
kv <- terra::project(study_area.v,crs(landcover_2005_SWIR))
j18
kv <- terra::project(kv, 4326)
kv <- terra::project(kv, "+proj=longlat +datum=WGS84 +no_defs")
j18
j18.c<- terra::crop (j18, kv)
j18.m <- mask (j18.c, kv)
writeRaster (j18.m, "../Downloads/j18.tif")
j15<-rast("../Downloads/wc2.1_2.5m_tmax_2010-2018/wc2.1_2.5m_tmax_2015-06.tif")
j15.c<- terra::crop (j15, kv)
j15.m <- mask (j15.c, kv)
writeRaster(j15.m,"../Downloads/j15.tif")
j15
j10<-rast("../Downloads/wc2.1_2.5m_tmax_2010-2018/wc2.1_2.5m_tmax_2010-06.tif")
j10.c<- terra::crop (j10, kv)
j10.m<-mask(j10.c,kv)
writeRaster(j10.m,"../Downloads/j10.tif")
j0<-rast("../Downloads/wc2.1_2.5m_tmax_2000-2009/wc2.1_2.5m_tmax_2000-06.tif")
j0.c<-terra::crop(j0,kv)
j0.m<-mask(j0.c,kv)
writeRaster(j0.m,"../Downloads/j0.tiff")
s2010<- rast("../Downloads/LE07_L1TP_141041_20201028_20201123_01_T1/LE07_L1TP_141041_20201028_20201123_01_T1_B7.tif")
n2010<- rast("../Downloads/LE07_L1TP_141041_20201028_20201123_01_T1/LE07_L1TP_141041_20201028_20201123_01_T1_B4.tif")

kv <- terra::project(kv, "+proj=longlat +datum=WGS84 +no_defs")

kv
nayakv <- terra::project(kv,crs(s2010))
s2010.c <- crop(s2010, nayakv)
s2010.m<-mask(s2010.c,nayakv)
n2010.c <- crop(n2010, nayakv)
n2010.m<-mask(n2010.c,nayakv)
ui2010 <- (s2010.m-n2010.m)/(s2010.m+n2010.m)
plot(ui2010)

s2015<-rast("../Downloads/LE07_L1TP_141041_20150524_20161026_01_T1/LE07_L1TP_141041_20150524_20161026_01_T1_B7.tif")
n2015<-rast("../Downloads/LE07_L1TP_141041_20150524_20161026_01_T1/LE07_L1TP_141041_20150524_20161026_01_T1_B4.tif")
s2015.c <- crop(s2015, nayakv)
s2015.m<-mask(s2015.c,nayakv)
n2015.c<-crop(n2015,nayakv)
n2015.m<-mask(n2015.c,nayakv)
ui2015<-(s2015.m-n2015.m)/(s2015.m+n2015.m)
plot(ui2015)

s2020<-rast("../Downloads/LE07_L1TP_141041_20201028_20201123_01_T1/LE07_L1TP_141041_20201028_20201123_01_T1_B7.tif")
n2020<-rast("../Downloads/LE07_L1TP_141041_20201028_20201123_01_T1/LE07_L1TP_141041_20201028_20201123_01_T1_B4.tif")
s2020.c<-crop(s2020,nayakv)
s2020.m<-mask(s2020.c,nayakv)
n2020.c<-crop(n2020,nayakv)
n2020.m<-mask(n2020.c,nayakv)
ui2020=(s2020.m-n2020.m)/(s2020.m+n2020.m)
plot(ui2020)
writeVector(nayakv, "../Downloads/nayakv.gpkg")
writeRaster(ui2010, "../Downloads/ui_2010.tif")
writeRaster(ui2015, "../Downloads/ui_2015.tif")
writeRaster(ui2020, "../Downloads/ui_2020.tif")


install.packages(terra)
library(terra)
rv<-vect("../Downloads/nayakv.gpkg")
rv
trj2000<-rast("../Downloads/j0.tiff")
trj2000
rv<-project(rv,crs(trj2000))
j2000.c <- crop(trj2000,rv)
j2000.m<-mask(j2000.c,rv)
r <- rasterize(rv, j2000.m)
zstats <- zonal(j2000.m, r, fun='mean', na.rm=T)

trj2010<-rast("../Downloads/j10.tif")
j2010.c <- crop(trj2010,rv)
j2010.m<-mask(j2010.c,rv)
r2010<- rasterize(rv, j2010.m)
zstats2010<-zonal(j2010.m,r2010,fun='mean',na.rm=T)

trj2015<-rast("../Downloads/j15.tif")
j2015.c<-crop(trj2015,rv)
j2015.m<-mask(j2015.c,rv)
r2015<- rasterize(rv, j2015.m)
zstats2015<-zonal(j2015.m,r2015,fun='mean',na.rm=T)


trj2018<-rast("../Downloads/j18.tif")
j2018.c<-crop(trj2018,rv)
j2018.m<-mask(j2018.c,rv)
r2018<-rasterize(rv,j2018.m)
zstats2018<-zonal(j2018.m,r2018,fun='mean',na.rm=T)
