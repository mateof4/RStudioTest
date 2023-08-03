### Control Structures
# If 
if(<condition1>) {
  ## do something
} else if(<condition2>)  {
  ## do something different
} else {
  ## do something different

# For
for (i in 1:10){
  print(i)
}

# While 
while(count < 10) {
        print(count)
        count <- count + 1
}
  
# Repeat, Next, Break (infinite loop until break)
x0 <- 1
tol <- 1e-8
repeat {
  x1 <- computeEstimate()
  
  if(abs(x1 - x0) < tol) {  ## Close enough?
    break
  } else {
    x0 <- x1
  } 
}

for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next                 
  }
  ## Do something here
}

### Functions
f <- function() {
         # This is an empty function
   }
f <- function(num) {
         hello <- "Hello, world!\n"
         for(i in seq_len(num)) {
                   cat(hello)
           }
         chars <- nchar(hello) * num
         chars
 }
f(3)

# ... argument
myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)         ## Pass '...' to 'plot' function
}


### Scoping Rules 
# Symbol

x<-1:10
if(x>5){
      x<-0
}

### Coding Standards



### Dates and Times 









