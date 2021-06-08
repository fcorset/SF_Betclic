
# sans les gros multis ( *200 et *1000)
  
multi.small<-c(100,50,10,5,4,3,2)
proba.small<-c(10,25,250,1500,7500,13832,26877)/50000

roi.small <- function(x) ((x+500)/1500*sum((multi.small-0.07)*proba.small/sum(proba.small))-1)*100

# avec multi

multi<-c(800,200,100,50,10,5,4,3,2)
multi.5<-c(800,160,100,50,10,5,4,3,2)
multi.10<-c(800,160,80,50,10,5,4,3,2)
multi.20<-c(800,160,80,40,10,5,4,3,2)
multi.100 <- c(800,160,80,40,8,5,4,3,2)

proba<-c(1,5,10,25,250,1500,7500,13832,26877)/50000

roi <- function(x) ((x+500)/1500*sum((multi-0.07)*proba)-1)*100

gain.theo.small <- function(n=2000,cev=75,bi = 5) n*bi*roi.small(cev)/100 + n*bi*0.07*0.4

gain.theo <- function(n=2000,cev=75,bi = 5) {
  p <- (cev+500)/1500
  res <- ifelse(bi==5,n*bi * (p * sum((multi.5-0.07)*proba)+(1-p) * sum((c(100,20)-0.07)*proba[1:2]) +0.07*0.4 - 1),
         ifelse(bi==10,n*bi * (p * sum((multi.10-0.07)*proba)+(1-p) * sum((c(100,20,10)-0.07)*proba[1:3]) +0.07*0.4 - 1),
         ifelse(bi == 20 || bi ==50,n*bi * (p * sum((multi.20-0.07)*proba)+(1-p) * sum((c(100,20,10,5)-0.07)*proba[1:4]) +0.07*0.4 - 1),
                ifelse(bi==100,n*bi * (p * sum((multi.100-0.07)*proba)+(1-p) * sum((c(100,20,10,5,1)-0.07)*proba[1:5]) +0.07*0.4 - 1),n*bi * (p * sum((multi-0.07)*proba)+(1-p) * (100-0.07)*proba[1] +0.07*0.4 - 1)
                       ))))
return(res)
}

roi.theo.wo.rb <- function(cev=75){
  p <- (cev+500)/1500
  return((p * sum((multi-0.07)*proba)+(1-p) * sum((c(100,20)-0.07)*proba[1:2]) - 1) *100)
}
roi.theo.w.rb <- function(cev=75){
  p <- (cev+500)/1500
  return((p * sum((multi-0.07)*proba)+(1-p) * sum((c(100,20)-0.07)*proba[1:2]) + 0.07*0.4 - 1) *100)
}

curve(roi.theo.w.rb,from=30, to= 120,ylab="ROI avec RB (bleu) et sans (rouge)",xlab="cev",main="ROI en fonction du cev avec RB",col="blue")
curve(roi.theo.wo.rb,from=30, to= 120,main="ROI en fonction du cev avec RB",add=T,col="red")



