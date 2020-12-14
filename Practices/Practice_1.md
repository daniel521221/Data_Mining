#### We import the data set
``dataset <- read.csv(file.choose())``

#### Categorical data encoding
``dataset$State = factor(dataset$State,
                      levels = c('New York', 'California', 'Florida'),
                      labels = c(1,2,3))
dataset``

#### We set our seed of randomness
``set.seed(123)``

#### We divide the data set into the training set and the test set
``split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)``

#### We adapt the multiple linear regression to the training set
``#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )``

#### Showing results
``summary(regressor)``

#### Prediction of test set results
``y_pred = predict(regressor, newdata = test_set)``

#### Showing results
``y_pred``

#### Assignment: Visualize Simple Linear Regression Model with R.D.Spend

# 

By building the optimal model using backward elimination, we can view each iteration as a procedure to obtain the optimal model.

### 1st iteration
``regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)``

### 2nd iteration
``regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)``

### 3rd iteration
``regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)``

### 4th iteration
``regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)``

#### Now we can say that we have an optimal model, so we use our prediction with the test data set.
``y_pred = predict(regressor, newdata = test_set)
y_pred``

## Task: Analyze the Back Automation Trace Delete Function

Backward elimination is used to select all predictors in the model, but only as a kind of initial procedure, then you iteratively remove the least contributing predictors and stop when you have a model where all predictors are statistically significant. In other words, it's like cleaning the model to make it as optimal as possible.

##### we use the backwardElimination to select all the predictors
##### in the model but just as an starting kind of procedure, then iteratively 
##### removes the least contributive predictors, and stops when you have a model 
##### where all predictors are statistically significant. In other words, is like
##### cleaning up the model to get it as optimal as we can.

``backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}``

#### Finally we use our training set and our variable SL as parameters for our backward elimination method.

``SL = 0.05``
``dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)``


Result

![131088949_728763611101110_811996566740418021_n](https://i.imgur.com/xFaZBrb.png)

