#### We configure our workspace
setwd('/home/leonardo/MineriaDeDatos/Data_Mining/Evaluation')
#### we load our csv and assign it to the data variable
data <- read.csv("Social_Network_Ads.csv")
data
#### we limit the data to be used for better prediction
data = data[3:5]

#### we transform our value
data$Purchased = factor(data$Purchased, levels = c(0, 1))

#### We divide our dataset into training data and test data to implement it in our algorithm in this case
library(caTools)
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.75)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)


#### Normalize the data in order to obtain the best performance of the algorithm
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#### we load our liberia e1071 to implement our naivebayes algorithm
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)

#### We create our prediction
y_pred = predict(classifier, newdata = test_set[-3])


#### we create the visualization of the data

library(ElemStatLearn)
#### We visualize the training data
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = ' Naive Bayes  Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


#### we visualize the test data
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



