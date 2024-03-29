#' Create File with Earthdata Login Credentials
#' 
#' @description 
#' Create a hidden \code{.netrc} file with Earthdata login credentials in your 
#' home directory. The information included therein is used to login to 
#' \url{https://urs.earthdata.nasa.gov/} which is a mandatory requirement in 
#' order to download MODIS data from LP DAAC, LAADS and NSIDC (see also 
#' \code{\link{MODISoptions}}). If \code{.netrc} does exists the function can
#' be used to re-enter credentials.  
#' 
#' @param usr,pwd Login credentials as \code{character}. If \code{NULL}, 
#' username and password are read from the terminal.
#' 
#' @return 
#' The \code{\link{invisible}} Earthdata login credentials as \code{list}.
#' 
#' @author 
#' Matteo Mattiuzzi and Florian Detsch
#' 
#' @seealso 
#' \itemize{
#' \item{\url{https://docs.opendap.org/index.php/DAP_Clients_-_Authentication#LDAP} 
#' (section 2.2)}
#' \item{\url{https://github.com/MatMatt/MODIS/issues/10}}
#' \item{\url{https://wiki.earthdata.nasa.gov/display/EL/How+To+Access+Data+With+cURL+And+Wget}}
#' }
#' 
#' @examples 
#' \dontrun{
#' EarthdataLogin()
#' }
#' 
#' @export EarthdataLogin
#' @name EarthdataLogin
EarthdataLogin <- function(usr = NULL, pwd = NULL) {
  
  server = 'urs.earthdata.nasa.gov'
  nrc <- path.expand("~/.netrc")
  
  # read .netrc entire file
  lns <- readCredentials()
  
  # get servers found on .netrc
  machine <- unlist(listPather(lns,'machine'))
  
  # if earthdata server is not in the netrc file
  ind = if (!server %in% machine) {
    # if server not present, add it in a new line
    length(lns)+1
  } else {
    which(machine == server)[1]
  }
  
  # create file
  if(!file.exists(nrc))
  {
    cat("Creating clear text file '~/", basename(nrc)
        , "' with Earthdata login credentials...\n", sep = "")
    insert <- 'y'
  } else
  {
    if(sum(machine %in% server)>0)
    {
      if (any(is.null(lns[[ind]]$login), is.null(lns[[ind]]$password))) {
        cat("'", nrc, "' with defective Earthdata login credentials found! Please correct them now...\n", sep = "")
        insert = "y"
      } else {
        insert <- tolower(readline(paste0("Earthdata credentials seem to be present, do you want to change them? (y/n) \n",sep="")))
      }
    } else
    {
      cat("'",nrc,"' without Earthdata login credentials found! Please add them now...\n",sep="")
      insert <- 'y'
    }
  }
  
  if(insert=='y')
  {
    ## username
    if (is.null(usr)) 
    {
      usr <- readline("Insert your Earthdata USERNAME: ")  
    }
    ## password
    if (is.null(pwd)) 
    {
      pwd <- readline("Insert your Earthdata PASSWORD: ")  
    }
  }
  # Y: add (new) credentials. N: reformat .netrc file
  
  # if credentials are present, do not change, unless specified by arguments or confirmed
  if(is.null(usr))
  {
    lin <- try(lns[[ind]]$login, silent = TRUE) 
    # if not in netrc file take it from the original server
    if(inherits(lin,'try-error'))
    {
      lin <- credentials()$login
    }
  } else 
  {
    lin <- usr
  }
  if(is.null(pwd))
  {
    pw <- try(lns[[ind]]$password, silent = TRUE) 
    if(inherits(pw,'try-error'))
    {
      pw <- credentials()$password  
    }
  } else 
  {
    pw <- pwd
  }
  
  lns[[ind]] <- list(machine = server, login=lin, password=pw)          
  
  netrc <- file(nrc,open = 'w'); on.exit(close(netrc))
  for (i in seq_along(lns))
  {
    write(paste(names(lns[[i]][1]), lns[[i]][1]), netrc)
    write(paste(names(lns[[i]][2]), lns[[i]][2]), netrc)
    write(paste(names(lns[[i]][3]), lns[[i]][3]), netrc)
  }
  
  Sys.chmod(nrc, mode = "600", use_umask = TRUE)
  
  return(invisible(credentials()))
}

## Earthdata login credentials from .netrc file
readCredentials = function(path = "~/.netrc") {
  
  # .netrc file
  nrc = path.expand(path)
  
  if (file.exists(nrc))
  {  
    lns = readLines(nrc)
    # remove empty lines
    lns = lns[lns!=""]
    #lns <- gsub(lns,pattern = ' urs.earthdata.nasa.gov$', replacement = ' e4ftl01.cr.usgs.gov')
    
    # get first position of earthdata inforation (.netrc file can contain several logins)
    machines = grep(lns, pattern = '^machine ')
    result <- list()
    
    j <- 0
    for(i in machines)
    {
      j <- j+1
      # prevent multiple consecutive spaces
      lns[i] <- gsub(lns[i],pattern = " +",replacement = " ")
      
      # if credentials have the three line formatting
      if(length(strsplit(lns[i]," ")[[1]])==2)
      {
        machine = strsplit(lns[i], " ")[[1]][2]
        login = if (!is.na(tmp <- strsplit(lns[i+1], " ")[[1]][2])) tmp
        password = if (!is.na(tmp <- strsplit(lns[i+2], " ")[[1]][2])) tmp
      } else
      {
        # if credentials are within a single line
        machine = strsplit(lns[i], " ")[[1]][2]
        login = if (!is.na(tmp <- strsplit(lns[i], " ")[[1]][4])) tmp
        password = if (!is.na(tmp <- strsplit(lns[i], " ")[[1]][6])) tmp
      }
      result[[j]] <- list(machine=machine,login=login,password=password)
    }
  } else {
    result = NULL
  }
  
  return(result)
}

# internal function to retrieve a specific earthdata server (hard coded for its now sufficient)
credentials <- function(path = "~/.netrc")
{
  #server   <- c('urs.earthdata.nasa.gov', 'e4ftl01.cr.usgs.gov','ladsweb.modaps.eosdis.nasa.gov', 'n5eil01u.ecs.nsidc.org')
  server   <- 'urs.earthdata.nasa.gov'
  lns      <- readCredentials(path)
  machines <- unlist(listPather(lns,'machine'))
  select   <- which(machines %in% server)
  return(lns[[select]])
}

# Source: https://rdrr.io/cran/MODIS/src/R/EarthdataLogin.R
