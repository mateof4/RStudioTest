#### 1 #### 

pollutandmean <- function(directory, pollutant, id = 1:332){
  
  file_paths <- list.files('specdata', pattern='*.csv', full.names=TRUE)
  vals <- numeric()
  
  for (i in id){
    df <- read.csv(file_paths[i])   
    vals <- c(vals, df[[pollutant]])
  }
  return(mean(vals, na.rm = TRUE))
}

pollutandmean('specdata', 'sulfate', 1:10)
pollutandmean("specdata", "nitrate", 70:72)
pollutandmean("specdata", "nitrate", 23)
pollutandmean("specdata", "sulfate", 34)
pollutandmean("specdata", "nitrate")

  





