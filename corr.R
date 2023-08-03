#### 3 #### 

corr <- function(directory, threshold=0){
  
  file_paths <- list.files('specdata', pattern='*.csv', full.names=TRUE)
  corrs <- c()
  
  for (i in c(1:length(file_paths))){
    df <- read.csv(file_paths[i]) 
    df <- na.omit(df)
    
    if (nrow(df)>threshold){
      
      corrs <- c(corrs, cor(df[,'sulfate'],df[,'nitrate']))
      
    }
  }  
  if (length(corrs)==0){
    corrs <- numeric(0)
  }
  return(corrs)
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)