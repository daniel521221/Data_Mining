## The grammar of graphics
Google defines a grammar as “the whole system and structure of a language or of languages in general, usually taken as consisting of syntax and morphology (including inflections) and sometimes also phonology and semantics”.1 Others consider a grammar to be “the fundamental principles or rules of an art or science”.2 Applied to visualizations, a grammar of graphics is a grammar used to describe and create a wide range of statistical graphics.3

The layered grammar of graphics approach is implemented in ggplot2, a widely used graphics library for R. 

- Layer
-   Data
-   Mapping
-   Statistical transformation (stat)
-   Geometric object (geom)
-  Position adjustment (position)
- Scale
- Coordinate system (coord)
 - Faceting (facet)
- Defaults
- Data
- Mapping

## Layer
Layers are used to create the objects on a plot. They are defined by five basic parts:

Data
Mapping
Statistical transformation (stat)
Geometric object (geom)
Position adjustment (position)

Layers are typically related to one another and share many common features. For instance, multiple layers can be built using the same underlying data. An example would be a scatterplot overlayed with a smoothed regression line to summarize the relationship between two variables:


## Data and mapping
Data defines the source of the information to be visualized, but is independent from the other elements. So a layered graphic can be built which utilizes different data sources while keeping the other components the same.


## Statistical transformation
A statistical transformation (stat) transforms the data, generally by summarizing the information. For instance, in a bar graph you typically are not trying to graph the raw data because this doesn’t make any inherent sense. Instead, you might summarize the data by graphing the total number of observations within a set of categories. Or if you have a dataset with many observations, you might transform the data into a smoothing line which summarizes the overall pattern of the relationship between variables by calculating the mean of  conditional on .

## Geometric objects
Geometric objects (geoms) control the type of plot you create. Geoms are classified by their dimensionality:

- 0 dimensions - point, text
- 1 dimension - path, line
- 2 dimensions - polygon, interval


## Position adjustment
Sometimes with dense data we need to adjust the position of elements on the plot, otherwise data points might obscure one another. Bar plots frequently stack or dodge the bars to avoid overlap

## Scale
A scale controls how data is mapped to aesthetic attributes, so we need one scale for every aesthetic property employed in a layer.

## Coordinate system
A coordinate system (coord) maps the position of objects onto the plane of the plot, and controls how the axes and grid lines are drawn. Plots typically use two coordinates (), but could use any number of coordinates. Most plots are drawn using the Cartesian coordinate system

## Faceting
Faceting can be used to split the data up into subsets of the entire dataset. This is a powerful tool when investigating whether patterns are the same or different across conditions, and allows the subsets to be visualized on the same plot (known as conditioned or trellis plots). The faceting specification describes which variables should be used to split up the data, and how they should be arranged.


## Defaults
Rather than explicitly declaring each component of a layered graphic (which will use more code and introduces opportunities for errors), we can establish intelligent defaults for specific geoms and scales. For instance, whenever we want to use a bar geom, we can default to using a stat that counts the number of observations in each group of our variable in the  position.



