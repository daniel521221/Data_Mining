# Data_Mining
practices performed for the data mining class

### Unit_1 Branch
This is the Unit 1 Branch, where we can find the work done for the data mining class

### Practice_1 
In this practice we test the law of large numbers using rnorm, following the instructions we first declare the sample size in this case we assign it to n.
Then we initialize a counter that we assign the value of 0. We initialize a for loop, as the instructions say we will declare the size of our sample, which in our case is n = 10, therefore we will write n, mean would be our mean vector and sd would be the standard deviation vector. To find out how many numbers there are between -1 and 1, we start a condition where if this is fulfilled our counter will increase, when the condition is not fulfilled it gives us the result variable that we obtain from the division of the counter between the sample.

n <-10
c<-0

for (i in rnorm (n,mean = 0,sd = 1)) {
  if(i>-1 && i<1){
    c<-c+1
  }
}

r <- c / n
r