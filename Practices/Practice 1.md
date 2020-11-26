## 1.face_grit
One way to add additional variables is with aesthetic ones. Another particularly useful way for categorical variables is to divide the graph into facets, that is, sub-graphs that each show a subset of the data.
```R
gplot(mtcars, aes(mpg, qsec)) + geom_point(aes(size = hp), alpha = 0.4)
+ facet_grid(factor(cyl)~factor(am))
```


## 2.geom_point
The color, size, and shape of the points can be changed using the geom_point () function as follows:


```R
geom_point(size, color, shape)
```



## 3.geom_bar
Bar charts can be created in R using the barplot () function. We can supply a vector or a matrix to this function. If we provide a vector, the graph will have bars with heights equal to the elements of the vector.
Now we can make a bar chart from this data.

```R
p <- ggplot(mtcars, aes(factor(cyl)))
p + geom_bar()
```

## 4.geom_line

A line chart or line chart or line chart or curve chart is a type of chart that displays information as a series of data points called 'markers' connected by straight line segments.

It is a basic type of chart common in many fields.

```R
ggplot(economics_long, aes(date, value01)) +
  geom_line(aes(linetype = variable))

```



## 5.geom_histogram
A histogram is a graph that enables you to discover and display the underlying frequency distribution (shape) of a continuous data set.

This allows inspection of the data for its underlying distribution (for example, normal distribution), outliers, skewness, and so on.



```R
geom_histogram(position = 'stack', stat = 'bin')

```







