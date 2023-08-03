library(datasets)
data(iris)
?iris
df = iris
head(df)
sepal_virg_length = mean(df[df[,'Species']=='virginica','Sepal.Length'])
print(sepal_virg_length)
apply(iris[1:4],2,mean)


data(mtcars)
head(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)
apply(mtcars, 2, mean)
mean(mtcars$mpg, mtcars$cyl)
lapply(mtcars, mean)
split(mtcars, mtcars$cyl)
sapply(mtcars, cyl, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)

hp_mean = tapply(mtcars$hp, mtcars$cyl, mean)
print(abs(hp_mean['4']-hp_mean['8']))
