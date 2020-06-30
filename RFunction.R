library('move')
library('maps')

rFunction <- function(data,edge=15)
{
  png("simple-static-plot.png") ## 
  coo <- coordinates(data)
  map("world",xlim=c(min(coo[,1])-edge,max(coo[,1])+edge),ylim=c(min(coo[,2])-edge,max(coo[,2])+edge))
  points(coo[,1],coo[,2],col=factor(trackId(data)),pch=20)
  dev.off() ##
}
