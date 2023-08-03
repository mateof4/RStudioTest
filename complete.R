#### 2 #### 


complete <- function(directory, id=1:332){
  
  file_paths <- list.files('specdata', pattern='*.csv', full.names=TRUE)
  
  columns = c("id","nobs") 
  df = data.frame(matrix(nrow = 0, ncol = length(columns))) 
  colnames(df) = columns
  
  for (i in id){
    df_data <- read.csv(file_paths[i]) 
    nobs = nrow(na.omit(df_data))
    df[nrow(df) + 1,] <- list(i, nobs)
  }
  print(df) 
}

complete('specdata', 1)
complete('specdata', c(2, 4, 8, 10, 12))
complete('specdata', 30:25)
complete('specdata', 3)


cc <- complete('specdata', c(6,10,20,34,100,200,310))
print(cc$nobs)

cc <- complete('specdata', 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))


