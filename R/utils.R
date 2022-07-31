# the chunk of codes here contain small scripts that might ...
# ... come handy while solving string related issues

# (Q1) get particular string or numbers from a single string
# for e.g. we have a string named "om.bhandari-1995/03/22.txt"
# Now, I want following three things:-

## 1. 19950322
a = strsplit(name, "-|.txt")[[1]][2]
b = strsplit(a, "/")
paste(b[[1]][1],b[[1]][2],b[[1]][3],sep = "")

## 2. 1995/03/02
strsplit(name, "-|.txt")[[1]][2]

## 3. om.bhandari
strsplit(name, "-")[[1]][1]

# Tips:

## 1. memuse::Sys.meminfo()


#### How to split a column in data frame to several columns 

# for e.g., a df contains a column name called "date" in format yyyy-mm-dd
# now I would like to split the columns into three different columns yyyy, mm, dd

library(tidyr)
df <- df %>%
  tidyr::separate(date, c("yyyy", "mm", "dd"))
