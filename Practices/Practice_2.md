##### Importing the dataset
dataset <- read.csv(file.choose())
dataset = dataset[3:5]

##### Encoding the target function as a factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

##### Import the caTools library
library(caTools)

##### Establish our seed of randomness
set.seed(123)

##### Separate our dataset into training and test data
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

##### Standardization
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

##### Adapting K-NN to the training set and predicting the results of the test set
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)

##### Make the confusion matrix
cm = table(test_set[, 3], y_pred)


##### View the results of the training set
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


##### In the result, it can be seen that although the division between the 2 types of groups can be clearly seen, there is still a certain error rate shown by the spots of opposite colors that are shown in the green group, which indicates that the approach to the result is not totally optimal.

![131568693_400744771134283_8059887037868699777_n](https://i.imgur.com/ngkM6Vy.png)