# plot the vertical bar plot between two variables (Station Name vs ROSE Index)
g <- ggplot(erosivity, aes(x=reorder(Station_Name, -ROSE_Index), y=ROSE_Index, fill = Station_Name)) +
  geom_bar(stat="identity", width=.5, fill="wheat") +
  labs(title="Monthly Rainfall Erosivity",
       x = "Station Name",
       y = "Soil Erosivity (MJmmha-1h-1)",
       subtitle="Station vs R-factor plot") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
# plot
g

# adds horizontal line which denotes threshold 
gv <- g + geom_hline(yintercept =  20000, linetype = "dashed", color = "orangered", size=1)
gv

# flip to create horizontal bar plot
gv + coord_flip()

# Note: reorder() allow us to plot either in ascending or descending order
