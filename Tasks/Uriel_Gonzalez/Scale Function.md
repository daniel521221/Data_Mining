Scale function

It is a generic function whose default method centers and / or scales the columns of a numeric matrix.
```R
scale(x, center = TRUE, scale = TRUE)

```



Parameters
x: a numeric array (like an object).
center: either a logical value or a numeric vector of length equal to the number of columns of x, where 'similar numeric' means that as.numeric (.) will be applied successfully if is.numeric (.) is not true.
scale: either a logical value or a similar numeric vector of length equal to the number of columns of x.

The value of "center" determines how the column is centered. If "center" is a vector of numeric type with a length equal to the number of columns of x, then each column of x has the corresponding value of center subtracted. If “center” is TRUE, the centering is performed by subtracting the means of the columns (omitting NA s) from x their corresponding columns, and if “center” is thus FALSE, no centering is performed.

The value of scale determines how the column is scaled (after centering). If scale is a vector of numeric type with a length equal to the number of columns of x, then each column of x is divided by the corresponding value of scale. If scale is TRUE then the scale is performed by dividing the columns (centered) of x by their standard deviations if “cente” is TRUE, and the root of the mean square otherwise. If scale is like this FALSE, no scale is performed.

The root mean square of a column (possibly centered) is defined as:

![image](https://user-images.githubusercontent.com/60412166/102171855-5df97c00-3e4c-11eb-9430-5a6baacadfe0.png)


Where x is a vector of the non-missing values and n is the number of non-missing values. In the case center = TRUE, it is the same as the standard deviation, but in general is not. (To scale by standard deviations without centering, use
 

```R
scale(x, center = FALSE, scale = apply(x, 2, sd, na.rm = TRUE))).

```
