#Configuramos nuestro workspace
setwd('/home/leonardo/MineriaDeDatos/Data_Mining/Evaluation')
#cargamos nuestro csv y lo asignamos a la variable data 
data <- read.csv("Social_Network_Ads.csv")
data
#limitamos la data a utilizar para mejor prediccion 
data = data[3:5]

#transformamos nuestro valor 
data$Purchased = factor(data$Purchased, levels = c(0, 1))

#Dividimos nuestro dataset en datos de entrenamiento y datos de testing para implementarlo en nuestro algoritmo en este caso
library(caTools)
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.75)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)


#Normalizamos los datos para poder obtener el mejor rendmiento del algoritmo 
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#cargamos nuestra liberia e1071 para implementar nuestro algoritmo naivebayes
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)

#Creamos nuestra prediccion 
y_pred = predict(classifier, newdata = test_set[-3])


#creamos la visualizacion de los datos 


#2nd part
library(ElemStatLearn)
# Visualizamos la data de entrenamiento 
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


#visualizamos la data de prueba
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



