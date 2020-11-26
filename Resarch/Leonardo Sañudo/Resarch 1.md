![](https://sites.google.com/site/jeronimolinarespaz/_/rsrc/1462454251388/modulos/el-programa-institucional-de-tutorias/instituto-tecnologico-de-tijuana/file.PNG)


#### National Technology of Mexico

#### Technological Institute of Tijuana

#### Academic Subdirectorate

#### Department of systems and computing

#### SEMESTER: August-December 2020

#### CAREER: ing. Computing

#### SUBJECT: Data Mining

#### Job Name: Grammar of the graphs

#### STUDENT NAME AND CONTROL NUMBER: Sañudo Camacho Leonardo Daniel 15212166

#### TEACHER'S NAME (A): José Christian Romero


## The grammar of graphics

The grammar of graphs move us from the paradigm of the types of graphs and focus on the elements that constitute a statistical graph, both those that are directly visible in the final result and those that, although they are not directly in view, configure the visible elements. By clearly identifying the elements we can bind them and in the same way that we chain words to produce sentences we can chain elements to produce graphics and understand graphics

## The graph grammar applied in ggplot ()

In the grammar of graphs, they have five basic components from which we can control practically all aspects of a graph. ggplot () implements them in its syntax. Several of the elements are created by default, for example, from the data mapping ggplot () creates the scale with its marks and labels. In the case of coordinates, it always takes a Cartesian system by default. In all cases we can subsequently modify these default values.


- A specification of mapping to variables.
- They can refer to both the axes of the graph (x, y)
- as well as other properties such as colors, symbols, sizes, fonts, line types, etc.
- In ggplot () they are specified with the arguments passed to aes ().


- A coordinate system.
- Controls the projection of numeric data to space.
- By default ggpplot () creates a Cartesian coordinate system with the x and y axes,
- We can change it to polar, ternary coordinates or cartographic projections.
- It can be modified by adding + coord_ *, where * is any coordinate system included in ggplot () or its extensions.


- A scale.
- It controls the relationship between the number series that we are representing and its representation in space.
- By default ggplot () creates a natural scale for the axes in which they extend a little more than the maximum and minimum observations.
- By default ggplot () places the axes at 0 on the scale.
- We can change the scale through a transformation, for example, going from natural to logarithmic scale.
- By default ggplot () creates scale marks and labels in closed numbers (units, tens, hundreds, thousands, etc.), depending on the range of our data.
- You can change the number and location of scale marks and / or labels.

