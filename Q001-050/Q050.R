# encoding=utf=8
# Euler 50: Consecutive prime sum

source('prime.R')

binarySearch <- function(vec, value) {
  begin <- 1L
  end <- length(vec)
  repeat {
    center <- as.integer((begin+end)/2)
    if(center==begin) {
      if(vec[begin]==value)
        return(begin)
      else if(vec[end]==value)
        return(end)
      else
        return(0)
    } else if(value>vec[center]) {
      begin <- center
    } else {
      end <- center
    }
  }
}

### Main:
library(plyr)
limit <- 1000000
result <- 0
numberOfPrimes <- 0L
primes <- get.prime(1, limit)
primeSum <- c(0, cumsum(primes))

progress <- create_progress_bar('text')
print(system.time({
  progress$init(length(primeSum))
  for(i in (numberOfPrimes+1):length(primeSum)) {
    for(j in (i-numberOfPrimes):1) {
      d <- primeSum[i] - primeSum[j]
      if(d>limit) break
      if(binarySearch(primes,d)>0) {
        numberOfPrimes <- i - j
        result <- d
        ri <- i
        rj <- j
      }
    }
    progress$step()
  }
  progress$term()
}))
cat(sprintf('%d has %d primes.\n', result, numberOfPrimes))

