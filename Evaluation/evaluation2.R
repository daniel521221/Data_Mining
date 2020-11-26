setwd('/home/leonardo/Desktop/Examen2R')
movies <- read.csv("Project-Data.csv")
library(ggplot2)

head(movies)
str(movies)



genref <- movies[movies$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]

filtro <- genref[genref$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]


ploting <- ggplot(data=filtro, aes(x=Genre, y=Gross...US ))


ploting + geom_jitter(aes(size=Budget...mill.,color=Studio)) + 
  geom_boxplot(outlier.colour = NA, alpha=0.3) + 
  
  #Coding partner
  

