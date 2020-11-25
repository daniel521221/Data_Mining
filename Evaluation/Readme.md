## Evaulation 

## read the csv file provited 

`stats <- read.csv(file.choose())`

`stats`

## created new dataset with the columns provited 

 `life <- data.frame(Country.Code= Country_Code, life.expentancy.1960 = Life_Expectancy_At_Birth_1960,life.expentancy.2013 = Life_Expectancy_At_Birth_2013)`

 ### merged the data by country code has is the columnd that both have in common set provided and the new dataset so all the data is under one csv file
`merged <- merge(stats, life, by.x ="Country.Code",)`

#### created a dataset using the info provited from the previously merged data where only the data from the year 1960 is shown using filters 
`newset1960 <-merged[merged$Year==1960,]`

#### created a dataset using the info provited from the previously merged data where only the data from the year 2013 is shown using filters
`newset2013 <-merged[merged$Year==2013,]`






### create the plots from the filter data set 

#### data from 1960 classifying by region

`qplot(data = newset1960, x =Fertility.Rate , y = life.expentancy.1960,
    color = Region, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Fertility rate vs life expentancy in 1960")`

#### data from 2013 classifying by region

`qplot(data = newset2013, x =Fertility.Rate , y = life.expentancy.2013,
      color = Region, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Fertility rate vs life expentancy in 2013")`
      
#In these two scatter diagrams we can observe the correlation between fertility rate 
#(the number of children per woman)and life expectancy (the maximum years that a person can live within a certain social context).
#In 1960 we can see that life expectancy did not exceed 75 years, while in 2013 it reached almost 85 years.

## Analisys

In 1960 we can see that mostly European countries are those with the longest life expectancy, given their low fertility rate, while underdeveloped regions, such as Africa or the Middle East, have a higher fertility rate and in turn a hope shorter life compared to developed countries.

There is a trend that is followed over time, as we can see the life expectancy is higher when the fertility rate is lower, in the year 1960 this trend is not so pronounced, but in 2013 we can observe it with more clarity, and this can be attributed to the socioeconomic level that that person may present as an only child or with a smaller family.

In addition to the fact that we can observe the evolution of some regions, such as Asia, which in 1960 could be on par with the African region, and already in 2013 it rivals the European region, this may be due to the economic positioning that the countries have had. Asian countries in recent years in addition to the fact that in the 60s many countries were at war.      
      
      
