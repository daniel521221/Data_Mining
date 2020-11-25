
##1.  diff() function
set.seed(123)
## Create the data
x = rnorm(1000)
ts <- cumsum(x)

## Stationary the serie
diff_ts <- diff(ts)
par(mfrow=c(1,2))
## Plot the series
plot(ts, type='l')
plot(diff(ts), type='l')

##2.  lenght () function 
dt <- cars
## number columns
length(dt)
length(dt[,1])

## 3. abs() Takes the absolute value of x
x <- -55
abs(x)

## 4. log(x, base=y) Takes the logarithm of x with base y; if base is not specified, returns the natural logarithm

x <-6
y <-10
log(x,base=y)


##5. exp() Returns the exponential of x
x <85
exp(x)

##6. mean() Mean of x

speed <- dt$speed
speed
# Mean () speed of cars dataset
mean(speed)

##7. median()
# Median speed of cars dataset
median(speed)


##8.var() # Variance speed of cars dataset
var(speed)


##9. sd() # Standard deviation speed of cars dataset
sd(speed)

##10. # Standardize vector speed of cars dataset		
head(scale(speed), 5)

##11. quantile
# Quantile speed of cars dataset
quantile(speed)


##12. # Summary speed of cars dataset
summary(speed)

##13. multi arguments function
times <- function(x,y) {
  x*y
}
times(2,4)

##14. apply function 
m1 <- matrix(C<-(1:10),nrow=5, ncol=6)
m1
a_m1 <- apply(m1, 2, sum)
a_m1

##15. lapply() function 
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

##16. sapply() funtion

dt <- cars
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)
lmn_cars


##17. tapply() function
data(iris)
tapply(iris$Sepal.Width, iris$Species, median)


##18. paste() function 
#p To combine vectors after converting them to characters
paste(1,"sam",2,"rob",3,"max", sep = ',')


##19. head () funtion To retrieve the first n rows of a matrix, data frame, or a vector
 
empid <- c(1:4)
empname <- c("Sam","Rob","Max","John")
empdept <- c("Sales","Marketing","HR","R & D")
emp.data <- data.frame(empid,empname,empdept)
print(head(emp.data,3))


##20. tail() function To retrieve the last n rows of a matrix, data frame, or a vector

x = data frame, matrix, or vector
n = number of rows to be retrieved
empid <- c(1:4)
empname <- c("Sam","Rob","Max","John")
empdept <- c("Sales","Marketing","HR","R & D")
emp.data <- data.frame(empid,empname,empdept)
print(tail(emp.data,2))

