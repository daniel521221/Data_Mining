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


