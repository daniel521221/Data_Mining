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
  

  theme (text = element_text(size=8)) + 
  ggtitle ("      Domestic Gross % by Genre") + 
  theme (plot.title = element_text(size=rel(2),  vjust=2, face="bold", color="black", lineheight=1.5)) + 
  
  
  labs(x = "Genre",y = "Grass % US") + 
  theme(axis.title.x = element_text(face="bold", vjust=-0.5, colour="purple", size=rel(1.5))) +
  theme(axis.title.y = element_text(face="bold", vjust=1.5, colour="purple", size=rel(1.5)))
