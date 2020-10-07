# install.packages("igraph") # Install package in console

library(igraph)          # load a package

g1 <- graph( edges=c(1,2, 2,3, 3, 1), n=3, directed=F ) 
plot(g1) # A simple plot of the network - we'll talk more about plots later


g<-read.graph("C:/karate.gml",format=c("gml")) # Load graph from file
plot(g)


