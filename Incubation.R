###Calculates the julian date turtle embryos reach a certain developmental stage###
###Currently in development, things work but they are slow###


setwd("C:/Users/christopher.edge/Documents/GitHub/Turtles/Data") #set the working directory to where your data are
nestdate <- read.csv(file = "nestdate.csv", header=T) #File with turtle ID and nest dates
develop <- read.csv(file = "develop.csv", header=T) #File with daily development rate
names(develop)
names(nestdate)

#calculate date at various stages
for (i in 1:length(nestdate)){
  #calculate date at stage 6
  a<-nestdate$nestdate[i] #store the nest date
  b<-nestdate$nestyear[i] #store the nest year
  current.sum <- 0
  while (current.sum <=6) {
    current.sum <- current.sum + develop$dev[develop$julian==a & develop$year==b]
    a <- a+1
  }
  nestdate$dateat6[i] <- a-1
  
  #calculate date at stage 11
  a<-nestdate$nestdate[i] #store the nest date
  current.sum <- 0
  while (current.sum <=11) {
    current.sum <- current.sum + develop$dev[develop$julian==a & develop$year==b]
    a <- a+1
  }
  nestdate$dateat11[i] <- a-1

  #calculate date at stage 20
  a<-nestdate$nestdate[i] #store the nest date
  current.sum <- 0
  while (current.sum <=20) {
    current.sum <- current.sum + develop$dev[develop$julian==a & develop$year==b]
    a <- a+1
  }
  nestdate$dateat20[i] <- a-1
  
}

#calculate stage at various days
for (i in (1:length(nestdate))){
  nestdate$stageat244[i] <- sum(develop[develop$year==nestdate$nestyear[i] & develop$julian >= nestdate$nestdate[i] & develop$julian <= 244,]$dev)
  nestdate$stageat258[i] <- sum(develop[develop$year==nestdate$nestyear[i] & develop$julian >= nestdate$nestdate[i] & develop$julian <= 258,]$dev)
  nestdate$stageat273[i] <- sum(develop[develop$year==nestdate$nestyear[i] & develop$julian >= nestdate$nestdate[i] & develop$julian <= 273,]$dev)
}
