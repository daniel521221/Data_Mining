## What is the scale function?

scale is a generic function whose default method centers and / or scales the columns of a numeric array.

#### Syntax
scale (x, center = TRUE, scale = TRUE)

#### Where:
X = a numeric array (like an object).

center = either a logical value or a numeric vector of length equal to the number of columns in x, where "similar numeric" means that as.numeric (.) will be applied correctly if is.numeric (.) is not true.
    
scale = a logical value or a numeric vector of length equal to the number of columns of x

#### Details

The center value determines how the column is centered. If the center is a vector of numeric type with a length equal to the number of columns of x, then each column of x has the corresponding value of the subtracted center from it. If the center is TRUE, then centering is done by subtracting the column means (omitting NA) of x from their corresponding columns, and if the center is FALSE, no centering is performed.

The scale value determines how the column is scaled (after centering). If the scale is a vector of numeric type with a length equal to the number of columns of x, then each column of x is divided by the corresponding value of the scale. If the scale is TRUE, the scale is performed by dividing the (centered) columns of x by their standard deviations if the center is TRUE and the root mean square otherwise. If the scale is FALSE, no scale is performed.

