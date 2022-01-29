# the following code enables user to download the table that we display in the markdown

# code for enabling csv download
write.csv2(uicn, "./file.csv")
readLines("./file.csv") %>% 
  paste0(collapse="\n") %>% 
  openssl::base64_encode() -> encoded

# call download
[Download CSV](`r sprintf('data:text/csv;base64,%s', encoded)`)
 
