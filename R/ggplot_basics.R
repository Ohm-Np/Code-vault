# line plots --------------------------------------------------------------------------
library(ggplot2)

# an example data from masters thesis branch
landcover <-
  read.csv("data/results/mapme_biodiversity/line_charts/landcover_1-16_wdpa-fishnets.csv")
long <- tidyr::pivot_longer(landcover,
                            cols = c("terra_zonal", "terra_extract", "exact_extract"))
result <- ggplot(long, aes(Cores, value)) +
  geom_line(aes(colour = name))
result


# bar plots -------------------------------------------------------------------------------
# an example data from masters thesis branch
di <- 
  read_csv("../../Om/masters-thesis/data/results/mapme_biodiversity/drought_indicator2022.csv")
long <- tidyr::pivot_longer(di,
                            cols = c("WDPA_7495", "Simplified_WDPA_4722", "Fishnet_216425"))
result <- ggplot(data = long, aes(x = reorder(name, -value), y = value, fill = Functions)) +
  geom_col(position = "dodge") +
  xlab("Type of Polygons") +
  ylab("Time elapsed (s)") +
  ggtitle("Comparison of time taken by three functions to compute drought indicator using mapme.biodiversity package")
result
