##### Import the dataset
dataset <- read.csv(file.choose())
dataset = dataset[3:5]

##### Encoding the target function as a factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

##### Iimport caTools library
library(caTools)

##### Establish our seed of randomness
set.seed(123)

##### Separate our dataset into test and training data
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

##### Data normalization
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])






##### We adapt the decision tree classification to the training set
##### Import the rpart library

library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)



##### Make the test set prediction
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred

##### Make the confusion matrix
cm = table(test_set[, 3], y_pred)
cm

##### View the graph of the training set

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

##### The graph would be the following:
![130864389_796263384290811_1963577937227582595_n](https://i.imgur.com/LJMMyga.png)
##### Visualising the Test set results

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

##### The graph would be the following:
![131419100_395038335066335_4273182298537487138_n](https://i.imgur.com/bVj9JlO.png)


##### Drawing the decision tree
plot(classifier)
text(classifier, cex=0.5)
![130864390_198682811857475_6473881647898589718_n](https://i.imgur.com/gn1NgwL.png)

###### The result would be the following: where it graphically shows us which are the most optimal decisions for a given problem presented based on the training and test set, this tree summarizes all the information classified in the KNN groups section for a faster understanding and get to a solution faster.