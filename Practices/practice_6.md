# Simple lineal regresion

We import our data set
```R

dataset <- read.csv(file.choose())

```


We import the caTools library
```R
dataset <- read.csv(file.choose())

```


We set our seed of randomness
```R
set.seed(123)

```


We separate our dataset into training data and test data

```R
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

```

 We fit the simple linear regression to the training set
```R
regressor = lm(formula = Salary ~ YearsExperience,
            data = dataset)

```


We get the results

```R
summary(regressor)

 We make the prediction of the test set
y_pred = predict(regressor, newdata = test_set)



```



We visualize the result of the training data
We import our ggplot2 library
```R
library(ggplot2)
ggplot() +
    geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
            color = 'red') +
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
    ggtitle('Salary vs Experience (Training Set)') +
    xlab('Years of experience') +
    ylab('Salary')

```



With the graph of the training set we can observe the points where they are earning more than expected according to their experience compared to their experience, there are 6 cases in which they are winning below expectations and there are 5 cases in which they are earning more than expected .


![REGRESION LINEAL SIMPLE1](https://user-images.githubusercontent.com/60412166/102155796-1b767600-3e31-11eb-9869-7ec6e96beded.png)




