setwd('/home/leonardo/Documentos/mineria_datos/evaluacion')
data <- read.csv("iris.csv")


# Importing the dataset
iris = iris[1:4]
toString(iris, width = NULL)


# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(iris, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


