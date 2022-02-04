# the following code enables user to download the table that we display in the markdown ----

# code for enabling csv download
library(openssl)

write.csv2(uicn, "./file.csv")
readLines("./file.csv") %>% 
  paste0(collapse="\n") %>% 
  openssl::base64_encode() -> encoded

# call download
[Download CSV](`r sprintf('data:text/csv;base64,%s', encoded)`)
 
# use plotly ----
library(plotly)

# prepare plot object - the data should be provided as long table
fig1 <- plot_ly(uicn_long.final, x = ~year, y = ~value,
                name = ~Name, color = ~Name, type = 'scatter', mode = 'lines+markers') %>%
  layout(title="Forst cover loss area in ha")
# view the plot
fig1
