# encoding=utf-8
# Euler 46: Goldbach's other conjecture

source('prime.R')

is.composite <- function(n) {
  if(n<4) return(FALSE)
  if(n%%2==0) return(TRUE)
  n2 <- floor(n/2)
  md <- n %% get.prime(2,n2)
  return(any(md==0))
}

get.composition <- function(n) {
  if(!is.composite(n))
    return(NA)
  pr <- get.prime(2, n-1)
  p0 <- n - pr
  sqr <- sqrt(p0/2)
  md <- sqr%%1==0
  if(any(md)) {
    id <- which(md)[1]
    res <- sprintf('%d = %d + 2 x %d^2', n, pr[id], sqr[id])
    return(res)
  } else {
    return(NA)
  }
}

### Test:
#a <- seq(1,40,by=2)
#b <- sapply(a, get.composition)
#d <- b[!is.na(b)]
#cat(d, sep='\n')
#rm(a,b,d)

### Main:
i <- 1
count <- 0
repeat {
  count <- count + 1
  if(count%%5000==0) cat(count, '=> ')
  if(is.composite(i)) {
    tmp <- get.composition(i)
    if(is.na(tmp)) {
      cat(sprintf('\nNumber = %d\n', i))
      break
    }
  }
  i <- i + 2
}

