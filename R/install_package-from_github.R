# to install a R package through pull request

# the script below shows an example to install mapme.biodiversity package through github from the created pull request
library(devtools)
install_github("https://github.com/mapme-initiative/mapme.biodiversity", ref = github_pull("71"))

# Note: #71 refers the number indexed in the pull request 
