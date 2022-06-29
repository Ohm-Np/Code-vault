library(fs)
library(vroom)

# Note 1: set session working directory to the path where all CSVs are located

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


# merge three data frames having one common column
final_data <- merge(df1, df2) %>%
  merge(df3)

# Note 2: set session working directory to the project directory after finishing the task
