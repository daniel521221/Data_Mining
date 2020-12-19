# Configuramos nuestro working directory 
setwd('/home/leonardo/Documentos/mineria_datos/evaluacion')
#Cargamos nuestra data asignadola a una variable
data <- read.csv("iris.csv")

#cargamos ggplot para graficar nuestros resultados
library(ggplot2)
head(data)
names(iris)

#ejecutamos una version basica de nuestro dataset para ver como esta estructurado
ggplot (iris, aes (Petal.Length, Petal.Width, color = Species)) + geom_point ()

#creamos nuestro algoritmo incializando 20 asignanciones de inicio aleatorio para que el 
#algoritmo selecccione la variacion mas baja dentro del grupo 
set.seed (20)
irisCluster <- kmeans (iris [, 3: 4], 3, nstart = 20)
irisCluster


