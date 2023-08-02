# R is a dialect of S

# Entering input 
a <- 1 
b <- 1:20
print(a)
print(b)

# atomic classes of objects: character, numeric, integer, complex, logical
# basic object: vector()
# attributes of the objects: names, dimnames, dimensions, class, length,..: attributes()

# Vectors and Lists
x <- c(0.5,0.6)
print(x)

as.logical(x)
print(x)

x <- list(1, "a", TRUE, 1+4i)
print(x)

# Matrices 
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)

m <- matrix(1:6, nrow=2, ncol=3)
m

m <- 1:10
m
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

# Factors: used to represent categorical data 

x <- factor(c("yes","yes","no","yes","no","yes","yes"))
x
table(x)
unclass(x)
x <- factor(c("yes","yes","no","yes","no","yes","yes"), 
            levels = c("yes","no"))
x

# Missing values
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

x <- c(1,2,NaN,NA,3)
is.na(x)
is.nan(x)

# Data Frames
row.names()
read.table()
read.csv()
data.matrix()

x <- data.frame(foo =1:4, bar=c(T,T,F,F))
nrow(x)
ncol(x)
x
# Names Attribute
x <- 1:3
names(x) <- c('foo', 'bar', 'norf')
x

x <- list(a=1, b=2, c=3)
x

m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a","b"), c("c","d"))
m

# Reading Tabular Data
# for r/w tabular data
read.table(file= , header= , sep= , colClasses= , nrows= , comment.char = , skip= , stringsAsFactors = ); write.table()
read.csv() # comma is the default separator
#for r/w lines of a text file 
readLines; writeLines
#for r/w in R code files
source; dump()
#for r/w in R code files
dget;dput()
#for r/w in saved workspaces
load; save()
#for r/w single R objects in binary form
unserialize; serialize()

# Reading Large Tables
# - Read the help page for read.table, which contains many hints
# - Make a rough calculation of the memory required to store your dataset. If the dataset is larger than the amount of RAM on your computer,
# you can probably stop right here.
# - Set comment.char = "" if there are no commented lines in your file.
# - it is important to specify the colClasses argument 
# - setting nrows helps with memory usage

initial <-read.table("datatable.txt", nrows=100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses=classes)
#calculation of memory requirements: (nrows x ncols x 8bytes/num) / (2^20 bytes/MB x 1000MB/GB)

# Textual Data Formats 
# • dumping and duting are useful because the resulting textual format is edit-able, and in the case
# of corruption, potentially recoverable.
# • Unlike writing out a table or csv file, dump and put preserve the metadata (sacrificing some readability), so that another user doesn't have to specify it all over again.
# • Textual formats can work much better with version control programs like subversion or git which can only track changes meaningfully in text files
# • Textual formats can be longer-lived; if there is corruption somewhere in the file, it can be easier to fix the problem
# • Textual formats adhere to the "Unix philosophy"
# • Downside: The format is not very space-efficient
y <- data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
new.y <- dget("y.R")
new.y

x <-"foo"
y <- data.frame(a=1, b="a")
dump(c("x","y"), file="data.R")
rm(x,y)
source("data.R")
y
x

# Connections: Interfaces to the Outside World
#functions: file(), gzfile(), bzfile(), url()
str(file)
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)

con <- gzfile("words.gz")
x <- readLines(con, 10)

con <- url("http...", "r")
x <- readLines(con)


# Subsetting Basics
# [] same class 
# [[]] extract elements of list or df
# $ extract elements of list or df by name 
x <- c("a","b","c","d","a")
x[1]
x[1:4]
x[x > "a"]
u <- x>"a"
x[u]

# Subsetting Lists
x <- list(foo = 1:4, bar=0.6)
x
x[[1]]
x$bar

x <- list(foo = 1:4, bar=0.6, baz='hello')
x[c(1,3)]

# Subsetting Matrices
x<-matrix(1:6,2,3)
x
x[1,2]
x[1,2,drop=FALSE]
x[1, ,drop=FALSE]

# Subsetting-Partial Matching
x <- list(aardvark = 1:5)
x$a

# Subsetting-Removing Missing Values
x<-c(1,2,NA,4,NA,5)
bad<-is.na(x)
x[!bad]

x<-c(1,2,NA,4,NA,5)
y<-c("a","b",NA,"d",NA,"f")
good<-complete.cases(x,y)
good 
x[good]
y[good]

# Vectorized Operations 
x<-1:4; y<-6:9
x+y
x>2
y==8
x*y
x/y

x<-matrix(1:4,2,2); y<-matrix(rep(10,4),2,2)
y
x*y

# Quiz
df = read.csv("hw1_data.csv")
df[c(nrow(df)-1,nrow(df)),]
df[47,'Ozone']
sum(is.na(df[,'Ozone']))
mean(df[,'Ozone'],na.rm=TRUE)
mean(na.omit(df[df[,'Ozone']>31 & df[,'Temp']>90,])[,'Solar.R'])
mean(df[df[,'Month']==6,][,'Temp'])
max(df[df[,'Month']==5,][,'Ozone'], na.rm=TRUE)
