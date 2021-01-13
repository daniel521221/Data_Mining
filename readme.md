
# Evaluation practice Unit 4


Importing the dataset

```R
stats <- read.csv(file.choose())

```

```R
iris = iris[1:4]
toString(iris, width = NULL)


```


 Using the elbow method to find the optimal number of clusters
```R
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(iris, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

```
![elbow](https://user-images.githubusercontent.com/60412166/102680795-96f95f80-4170-11eb-8012-ac4d1e413ccc.png)

Fitting K-Means to the dataset
```R
set.seed(29)
kmeans = kmeans(x = iris, centers = 3)
y_kmeans = kmeans$cluster


```

 Visualising the clusters
```R
# install.packages("cluster")
library(cluster)
clusplot(iris,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris'),
         xlab = 'Length',
         ylab = 'Width')

```
![cluster](https://user-images.githubusercontent.com/60412166/102680797-982a8c80-4170-11eb-9329-ceeb8c0b9451.png)
