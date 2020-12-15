

# RANDOM FOREST
We import our data set
```R
dataset <- read.csv(file.choose())

```


We take only the columns with which we are going to work
```R
dataset = dataset[3:5]

```


 Encoding the target function as a factor
 ```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

```


 We import our caTools library
 ```R
library(caTools)

 We set our seed of randomness
set.seed(123)


```

 We separate our dataset into training data and test data
 ```R
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

```


 Normalización
 ```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

```


We separate our dataset into training data and test data We import our random library Foresteba
```R
library(randomForest)

 We establish our seed of randomness
set.seed(123)

```


 



We fit the random classification of forests to the training set
```R
classifier = randomForest(x = training_set[-3],
                      y = training_set$Purchased,
                      ntree =10)

```


We make prediction from test data
```R
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

```


 We make our confusion matrix
 ```R
 cm = table(test_set[, 3], y_pred)
cm


```


We visualize the result with the training data
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
    main = 'Random Forest Classification (Training set)',
    xlab = 'Age', ylab = 'Estimated Salary',
    xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


```
![Random forest1](https://user-images.githubusercontent.com/60412166/102156239-06e6ad80-3e32-11eb-983c-add2b72ca1bd.png)







 We visualize the result with the test data
 ```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
    xlab = 'Age', ylab = 'Estimated Salary',
    xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


```

![random forest2](https://user-images.githubusercontent.com/60412166/102156301-1f56c800-3e32-11eb-8fe1-2dceac38c4e8.png)



We plot our classifier
```R

plot(classifier)
```

![random forest 3](https://user-images.githubusercontent.com/60412166/102156322-2ed61100-3e32-11eb-882e-ef62d2e4d957.png)



