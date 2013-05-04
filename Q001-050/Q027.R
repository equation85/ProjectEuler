# encoding=utf-8
# Euler 27

source('prime.R')

largestN <- function(a, b) {
  n <- 0
  repeat {
    v <- n*n + a*n + b
    if(!is.prime(v)) break
    n <- n + 1
  }
  return(n)
}

### Main:
library(plyr)
maxN <- 0
pair <- NULL
progress <- create_progress_bar('text')
progress$init(length(-999:999)^2)
for(a in -999:999) {
  for(b in -999:999) {
    tmp <- largestN(a,b)
    if(tmp>maxN) {
      pair <- c(a,b)
      maxN <- tmp
    }
    progress$step()
  }
}
progress$term()
cat(sprintf('a=%d, b=%d, n=%d, axb=%d\n', pair[1], pair[2], maxN, prod(pair)))
