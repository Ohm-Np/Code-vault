library(fs)
library(vroom)

# Note: set session working directory to the path where all CSVs are located

# load all files via pattern 
files <-
  fs::dir_ls(glob = "*abc.csv")
# bind all files
data <-
  vroom::vroom(files, delim = ",")
# write to disk
write.csv(data,
          "file_name.csv",
          row.names = F)


