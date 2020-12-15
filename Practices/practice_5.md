
We import our data set

```R
dataset <- read.csv(file.choose())
dataset = dataset[4:5]

```


We apply the elbow method, to find out our adequate number of clusters

We set our seed of randomness
```R
set.seed(6)

```

```R

```


We prepare the vector for the cycles to obtain the clusters

```R
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)


```

Now if we apply the elbow method
```R
plot(1:10,
    wcss,
    type = 'b',
    main = paste('The Elbow Method'),
    xlab = 'Number of clusters',
    ylab = 'WCSS')


```







From the graph it can be obtained that from point 5 a change is observed which serves as a reference to be able to notice the change curve.

![KMEANS1](https://user-images.githubusercontent.com/60412166/102155253-0c42f880-3e30-11eb-9f30-57d18b68614f.png)



We fit the K-means method to our data set
```R
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster

```


We import our cluster library
```R
library(cluster)

We plot the final result
         ylab = 'Spending Score')


```








![KMEANS2](https://user-images.githubusercontent.com/60412166/102155281-1d8c0500-3e30-11eb-874e-26f57288b824.png)


In the groups, it can be seen which are the preferred clients to offer the loans, it can be seen that within the range of 20 to 60 they are the ones with the most income and spend in proportion to that income, which makes them the most viable to obtain it.








