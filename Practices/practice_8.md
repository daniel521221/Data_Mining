

# SVM

we select the training set
```R
set = training_set

```



Next, the ranges of the sequences within our filtered data set are marked, which are delimited with the use of the max and min functions and apart the passage of these sequences is marked with a factor of .01 finally they are saved in the variables x1 and x2, which allows us to define the background of our graph.
```R
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

```


Expand allows us to carry out all the combinations of variables in the dataset.

and grid creates a framework for all these combinations of the factors that were provided
```R
grid_set = expand.grid(X1, X2)

```


we add a column with their respective names
```R
colnames(grid_set) = c('Age', 'EstimatedSalary')

```


a prediction is made with our data classifier and our already delimited model background
```R
y_grid = predict(classifier, newdata = grid_set)

```


A plot of the data of our dataframe minus the vector -3 is generated. We add labels and name its limits that had already been made previously with the names of x1 and x2
```R
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

```


a line is created to an existing graph, which will be our division between green and red, with the numerical matrix of our predictions from the data classification
```R
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

```



With grid_set we pull all the limits and ranges of the background to be able to assign a color to their space
```R
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))

```


And with this line we color the points of our data set using the ifelse function
```R
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```



What differentiates this code from the others is that the SVM algorithm is used in classifying the data, as you can see below. It is used mainly to estimate a data density or for data regression and classification.
```R
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')


```


In the following code, exactly the same is done before, but with the difference that now the test set is used instead of the training set
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


```

